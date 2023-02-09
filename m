Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC16699845
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:03:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9144BF36;
	Thu, 16 Feb 2023 16:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9144BF36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559835;
	bh=BLhFFCKHm0oII2gyoV1aB9Sk1JL4f2g73gTx0u/oBCg=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gDnhK7uSPfRf98YH9N/9iGzYU345DU4Ivce54IeUaODfu5e41KGrwgtuUmUGd610U
	 W/jRASzPq6V7w+aKw8IPzkl3Sl3VgvEf9n1bDaaDszF0NWsmVxGj3MXcnZM4h79Vfa
	 rH2Ift2ipfcNU65vKePmFShJ35FNK/B/Uq3ZZGVM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F2B2F80549;
	Thu, 16 Feb 2023 15:56:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DAD2F800E4; Thu,  9 Feb 2023 14:03:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD5B2F80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 14:03:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD5B2F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=SsrSgA7W
Received: by mail-io1-xd33.google.com with SMTP id j17so620274ioa.9
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 05:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BLhFFCKHm0oII2gyoV1aB9Sk1JL4f2g73gTx0u/oBCg=;
        b=SsrSgA7W7bB4sFMXfTS+q0CH/gxFqWUiJCqRSd3KHmT3Xa4ioR8qzUJ+TBoG/IfQNi
         8WRNpqu1r0iylVt1tQR8sjkU75SX1H2X/ZtPkZGsA4KdrbrEkAR8IJQxfUYEKsFfgynb
         CSkjD06fekzjYYLvY7I4uj+cVix9r6uFDm4ZmIMpSuCMvMwYJ3Txu9V5QBDggBHhlROt
         5Kp0XWqXLQRcE+6OglHnkOOZ00f80cYU57P7iMazOIiruVzUNaGKFodOavcdl4OYeS20
         XMfTMCdz3nJj3xivbK4fg1kbVqNVYzhfqTgW37MIZVE6d5tgLIKQtWo3p2mmFljO10c5
         7hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLhFFCKHm0oII2gyoV1aB9Sk1JL4f2g73gTx0u/oBCg=;
        b=O95J3F3E40pw94BsWElsM1ya+pSzGaOmqeWoyGGYH3u4csecVIXZfXFwo9ZL4fS5UZ
         D0CVMk8TJzB0h/K9zVBugpL+YMx2ZwtvMKQOztkHQkNy9YBkudl3dA4fREr+G9OVrysd
         it8RnQPyzHDY8LnTcqocm+jB+ZKStaN+IM3scFktS2aHQI+7a/0/DpAhrdeKILbtdgGI
         Gu8cpytiG6RsCKPEa64RTCR02XQnP8mG23KB8WFB6MWv2jJNUelDvMDv3NS1h3EO2G5+
         73EjO0iks4jGBfbs6vgnttD2CWfwZuDEi2aGV3gG/xtfFwo2n99kbBg5GT/cQEV4wr3y
         o4KA==
X-Gm-Message-State: AO0yUKVqXLuixjA0FiOU/ZTt8HDqGlrUcbYOQElxdsJ+cyNl9GVE/xSY
	7hY+WnsZtQd7mhDtUsbm0nXuNzbX0G7uFwOIr+9a8A==
X-Google-Smtp-Source: 
 AK7set/JihrZo9EK10tzAFsgIJq8Bjy8Qq/bLGfpFP5vdpqkdr/gvIREuns5dE8LD107MiBMBB1OcM+YYfX6Qz+c08M=
X-Received: by 2002:a02:cc64:0:b0:3c2:c93f:e40 with SMTP id
 j4-20020a02cc64000000b003c2c93f0e40mr3000524jaq.126.1675947789836; Thu, 09
 Feb 2023 05:03:09 -0800 (PST)
MIME-Version: 1.0
From: Albert Wang <albertccwang@google.com>
Date: Thu, 9 Feb 2023 21:02:58 +0800
Message-ID: 
 <CANqn-rhFH+RivRdiGtdFpjFKEpsJ497Z-NrtJ+naSHE+gJrzMg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/22] usb: xhci: Add XHCI APIs to support USB
 offloading
To: Wesley Cheng <quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: albertccwang@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UU5NYBOYOS5NQ36AA2LE335I6USGUW4N
X-Message-ID-Hash: UU5NYBOYOS5NQ36AA2LE335I6USGUW4N
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:56:51 +0000
CC: Thinh.Nguyen@synopsys.com, agross@kernel.org, alsa-devel@alsa-project.org,
 andersson@kernel.org, bgoswami@quicinc.com, broonie@kernel.org,
 devicetree@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 Jack Pham <quic_jackp@quicinc.com>, quic_plai@quicinc.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UU5NYBOYOS5NQ36AA2LE335I6USGUW4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Wesley,

It looks like I can get the transfer ring address by calling
xhci_get_xfer_resource,
and the xhci_get_ir_resource() is called to get access to the new structure
"xhci_interrupter" for the event ring address. From code review, I can
say these
APIs allow us to get the information we need.

Of course, we will integrate this patchset to verify if compatible
with our design.

Thanks,
Albert
