Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD598BC2D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48878DF8;
	Tue,  1 Oct 2024 14:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48878DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786140;
	bh=q7eskfOPt+1rRCtOr6+tX3pkJAaYv+NDxxYgXtTbR9I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OpxftU+SSb/gjkqpF11dVnJGDBi4/TzTSEHrowzZjmKFgIhoeEyiZPDJGaZLHvZfh
	 DWb8fFwilPxafYxoSnm1oSBAjXlZh3d00f8TpkEvRFTX/cfC5EwMuHOEnoTzYi6c1c
	 1qWlKCgh5NgSjwGPSrgMJabeByQ4/VcLJU3kC5gY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09593F805D8; Tue,  1 Oct 2024 14:35:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 061E7F805C7;
	Tue,  1 Oct 2024 14:35:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 748C2F80007; Mon, 23 Sep 2024 01:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 735C4F80007
	for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2024 01:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735C4F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JhmnCzBE
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f763e9e759so41694351fa.3
        for <alsa-devel@alsa-project.org>;
 Sun, 22 Sep 2024 16:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727047419; x=1727652219;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7eskfOPt+1rRCtOr6+tX3pkJAaYv+NDxxYgXtTbR9I=;
        b=JhmnCzBEWlsGFC1sDtddmgaUlCCotNvz1DBn6ONGsc4j9Pq8mAFoNi6G2yviyVyDmt
         NRM76jnZr+MBpoEFZH6ipYtJ/HPWrgEqGVw8ZB1Vo7qB3+6OX9Prf2QVI/z2PBsJ2ntW
         mpjRXBvLS0yReI2CxLBcPTpkrb9iUuedFIS+Av3zTlobMAZoiXAPtKv742yELWFchYv2
         aNV5fsCurKtxqmMf+mH35+FNfTYsUYaKT9X2AZ01OfhbyM5pCuxstRTqN/G+u8JCXJKF
         ZTDfvr23gIvrBSVKnHZKzev63cUc3fXLgRnon+Zi0nyf/pk7rjN+C7idMDOjhw76S8P/
         AF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727047419; x=1727652219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7eskfOPt+1rRCtOr6+tX3pkJAaYv+NDxxYgXtTbR9I=;
        b=RB5XL0oBBBYMy7jXtc8X4bBfvAXX+NOvOJrJAZ4ogGG45G4hqV2IOGzl6aUmp2i3Lc
         olbp/zG6tEzv88ELEkFHSfpIx5bu+/G6iT1td8Yzeml8xiRAJSULknrjH+LMalEsLu/x
         ZOqCJEcnE+JhxS20g0EXweeBUczJj/hIVEOiKDqKxzmgHOnGdYFaa4guVRRCOuU3C4tD
         rymIGHmXSxj39gO4b+5GwY8RhYtnMi4ruwrQfsd+5969LmKjkD0llp0kezyN2XzwZ5yM
         ozZTnsS+6KkC2wBjxpo9pVNgVW8WNwyRSkUtZKUvL1faMy+Tvatj/PO2cnZAsFMzQOn5
         LdXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8S4pfEdF1z5tPWq2nVrb/3QiIkxWPszSEpJVZ6lWl2o7VLRVthrLtU7gW0Z9PlwEPWzorgEhl2eMn@alsa-project.org
X-Gm-Message-State: AOJu0Yy6YZK1D51O3OlRvzxL4Cb5yqAFbAqUZ7XUJJyBddvfsZYp+9Wg
	ZGf0fbDS4xIK5Aihi9oj4/yiVlQ11lmqz0fpdfZUKC3UDD3KqcvU
X-Google-Smtp-Source: 
 AGHT+IFxxbTsRovcLK/IAIObXStATfMZ7Iuax45veoWqZPyjnMH/P/kvJozSKjZWi/qtWeIKTq4t3w==
X-Received: by 2002:a2e:be9e:0:b0:2f7:cba9:6098 with SMTP id
 38308e7fff4ca-2f7cba9614dmr49207831fa.19.1727047418324;
        Sun, 22 Sep 2024 16:23:38 -0700 (PDT)
Received: from foxbook (bgu157.neoplus.adsl.tpnet.pl. [83.28.84.157])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d2e1deesm27117811fa.10.2024.09.22.16.23.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 22 Sep 2024 16:23:36 -0700 (PDT)
Date: Mon, 23 Sep 2024 01:23:28 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <mathias.nyman@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
 <alsa-devel@alsa-project.org>, <bgoswami@quicinc.com>,
 <broonie@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
 <devicetree@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
 <gregkh@linuxfoundation.org>, <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <mathias.nyman@intel.com>, <perex@perex.cz>,
 <pierre-louis.bossart@linux.intel.com>, <robh@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait
 for completion
Message-ID: <20240923012328.1e4d0bc6@foxbook>
In-Reply-To: <182938da-da86-49a4-800a-446954cc6c60@quicinc.com>
References: <20240913103237.2f5dc796@foxbook>
	<a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
	<20240915095514.6b01fefb@foxbook>
	<182938da-da86-49a4-800a-446954cc6c60@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: michal.pecio@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RZHZC6BQMISGXHDHJPO4A3HO533NGX4D
X-Message-ID-Hash: RZHZC6BQMISGXHDHJPO4A3HO533NGX4D
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:34:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZHZC6BQMISGXHDHJPO4A3HO533NGX4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

> So what I ended up doing was to split off the context error handling
> into a separate helper API, which can be also called for the sync ep
> stop API.=C2=A0 From there, based on say....the helper re queuing the stop
> EP command, it would return a specific value to signify that it has
> done so.=C2=A0 The sync based API will then re-wait for the completion of
> the subsequent stop endpoint command that was queued.

AFAIK retries are only necessary on buggy hardware. I don't see them on
my controllers except for two old ones, both with the same buggy chip.

>=C2=A0In all other context error cases, it'd return the error to the calle=
r,
> and its up to them to handle it accordingly.

For the record, all existing callers end up ignoring this return value.

Honestly, I don't know if improving this function is worth your effort
if it's working for you as-is. There are no users except xhci-sideband
and probably shouldn't be - besides failing to fix stalled endpoints,
this function also does nothing to prevent automatic restart of the EP
when new URBs are submitted through xhci_hcd, so it is mainly relevant
for sideband users who never submit URBs the usual way.

My issue with this function is that it is simply poorly documented what
it is or isn't expected to achieve (both here and in the calling code
in xhci-sideband.c), and the changelog message is wrong to suggest that
the default completion handler will run (unless somewhere there are
patches to make it happen), making it look like this code can do things
that it really cannot do. And this is apparently a public, exported API.

Regards,
Michal
