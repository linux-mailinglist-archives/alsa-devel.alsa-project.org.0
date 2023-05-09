Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BC36FD725
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3662710A7;
	Wed, 10 May 2023 08:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3662710A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700606;
	bh=wQcWu1/k4oHKrSIWai7rA70WHpO9bUeYTkk2Hc6RrjQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LSXP2sdtGN/ePZw43gpF0+gfeqzkWOhKh0w3Rne/HckXBtvcDiH2k3Vgo06tIX1YV
	 ADFwk6fkQab3w6bcWmFF8nRfcOWglwELK18k4fakNEIA4KPxPuhQovHIpR6atViox4
	 mQ/kQmsJnH/SBZCqA5VflzpHuuN8+UC/fuuKkHBU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3276F8056F;
	Wed, 10 May 2023 08:33:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4697F804B1; Tue,  9 May 2023 20:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57BFFF80087
	for <sound-open-firmware@alsa-project.org>;
 Tue,  9 May 2023 20:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BFFF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=fD/IyGkA
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-643465067d1so4697780b3a.0
        for <sound-open-firmware@alsa-project.org>;
 Tue, 09 May 2023 11:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683656536; x=1686248536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKe8Pp2wtdvPrQGGnJvSNSlITt6IxAAkvg+3kLfckbI=;
        b=fD/IyGkAVzIR5xh0NsoPzsDCzibaCxvmjEWpcedSx+oVtQdx1jampwTMAQZ5/g7O9i
         6zjBOsMY7nzNkM7iYYJG8H+srQ9XEFFcCKkv+Vj9flgQpCpnMeSEFTUFnfj9R0YxL5/v
         0WwFMaew8ekI4jVmo6hWtqh6fD1CJFKaApFYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683656536; x=1686248536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKe8Pp2wtdvPrQGGnJvSNSlITt6IxAAkvg+3kLfckbI=;
        b=gwy9Mcqt/3cDnMBm1fKup6eqSULTUv2xihCL4ILOJpXCAqYDT600lSl4I0Mdm624gE
         DflwZ46xW/NPs0MNCX8nh+VvyBaRu482MPhMUeDR/epdhZ9iHZvNBlFepCpKTmOa4EL1
         o7rT/0fUCxuFRlUDN6fQItFbN2czTgSli8bTvxy0nyZWDdnb05mCpUcXE4xOBe2PcMyD
         xM9IE6D0RmeuLcJ9DDFtGYTylcA4QRG09NVOI7DD2Z8tsw3F2EkjepCf4MiRH3E4jDKC
         6vo92vwTqa/UYENr4ge5+X7nntu+kXAUWWIX5FmVi5ovMx1TRVDLpiuj3p10DWvpHW60
         gdAg==
X-Gm-Message-State: AC+VfDxZUxJw0K21xIyy26ShK9LT4NtXMREMLEpIjGmS+1G9hbjU89RK
	53Yxox8iCewoZnKNNACw/hyqgQ==
X-Google-Smtp-Source: 
 ACHHUZ6l0nwBtg6lvGHvuF2ITo6e27Y61tXoxVvfDOQnlqW+35xSOUeQcZctmTRLbchs10IUwS30Zg==
X-Received: by 2002:a05:6a00:1a50:b0:643:59cd:6caa with SMTP id
 h16-20020a056a001a5000b0064359cd6caamr19635723pfv.7.1683656536010;
        Tue, 09 May 2023 11:22:16 -0700 (PDT)
Received: from nitro.local ([64.141.80.140])
        by smtp.gmail.com with ESMTPSA id
 17-20020aa79151000000b0063b8ddcdde9sm1811133pfi.65.2023.05.09.11.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:22:15 -0700 (PDT)
Date: Tue, 9 May 2023 14:22:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <20230509-mug-private-mess-6a36d2@meerkat>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
X-MailFrom: konstantin@linuxfoundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-sound-open-firmware.alsa-project.org-0;
 header-match-sound-open-firmware.alsa-project.org-1
Message-ID-Hash: 6MULBRPZVW2OY3K3L27V2MWF77H2EVD5
X-Message-ID-Hash: 6MULBRPZVW2OY3K3L27V2MWF77H2EVD5
X-Mailman-Approved-At: Wed, 10 May 2023 06:33:09 +0000
CC: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MULBRPZVW2OY3K3L27V2MWF77H2EVD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 09, 2023 at 11:54:18AM +0200, Jaroslav Kysela wrote:
> The signature is correct in the encapsulated original e-mail. The b4 should
> be improved in my opinion.

This is non-fixable. The "mitigations" send messages with a completely
different message-id, and this breaks pretty much everything. For example, a
message sent to another list would have the original message-id, but a
different one if someone retrieves it via the alsa-project subscription. So,
if someone responds to the message with the bogus rewritten message-id, it
would be in the wrong place in the thread.

This is just not usable for patch workflows.

> For example, here is the original message:
> 
> https://lore.kernel.org/alsa-devel/168311377075.26.14919941665402646886@mailman-core.alsa-project.org/

This demonstrates the above problem. This message has a bogus message-id, but
it sets in-reply-to of the cover letter. Someone sending their reviewed-by
trailer to this patch would, in fact, send it with the cover letter as the
parent (meaning it should apply to the entire series).

> I guess that the vger servers have similar issues, because servers with
> DMARC enabled on the ingress side can reject e-mails. It's related to e-mail
> standards.

It is perfectly possible to operate a mailing list server and be
DMARC-compliant (at least for DKIM-signed messages) without requiring any of
the horrible things mailman-3 is doing:

https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html

-K
