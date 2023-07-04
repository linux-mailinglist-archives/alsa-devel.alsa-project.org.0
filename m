Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812187475AC
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 17:54:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D105846;
	Tue,  4 Jul 2023 17:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D105846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688486041;
	bh=AQzPbMy6bLIwgYfsKMtFloje7y7HLAc/7B7bMVTd8MA=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sYK+3R185N0Y3q2HRoSbcKSh0O07r7SKiMAV2leiqcw659UfzCGYvA1w3BAurcDuY
	 Jye0Bu0+p3oZ72nf+B2/0Nu7nGdciK4aMZy8J+w6AWFsIrauc0fqgCRL9fHnIl990o
	 PgFcJSoCiESxg9uE49sN9FkEuP9cOJS3nuzl+cwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30E6DF8055A; Tue,  4 Jul 2023 17:52:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90606F8055B;
	Tue,  4 Jul 2023 17:52:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD6F6F80125; Tue,  4 Jul 2023 14:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A57D0F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 14:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A57D0F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=streamunlimited.com header.i=@streamunlimited.com
 header.a=rsa-sha256 header.s=google header.b=UTBBvWBN
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc0981733so54192515e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Jul 2023 05:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1688473051; x=1691065051;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AQzPbMy6bLIwgYfsKMtFloje7y7HLAc/7B7bMVTd8MA=;
        b=UTBBvWBNn8lzJegxRmscSHuBQKef9cM+lHyDU5fHYdSTpn0VOQDt0CLb0YHsG6CMJV
         9VnLfF2p47prSAzv0hIJTgsI5YkFxkNr2I1tvWY9ROANtOiA0RKu/YNH6Lv80IouExkZ
         u6TJC4ThNRyNk9ypGvwkmHV9INyvXfPspeBUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688473051; x=1691065051;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQzPbMy6bLIwgYfsKMtFloje7y7HLAc/7B7bMVTd8MA=;
        b=UxTdAWBZpqp0y5nFPkfKbOZDGdEPa3JxhJQEEspkZ2/nWMRicUL/QC5y/K9St1bmyY
         7TbumVppqJlF2cv3rrR+cckZrAJQeusZq03Gr9n6kdEE3QWs2w+1GL8Cg4Yl0SBBylXc
         1zZJ+D1oitCTCOPP4m6mzmmvKb/c7rWfjcoBYcCaQeItMk+9WeYhyzvh1uNye2gQdRjv
         qmmnYlDwyNIbWqaGVDbNwgh54QlYg7wM0Zk2SGgQ1oEWsyZFXZGjYEki0FJCBuxvcuwu
         lxhPmXjuhjtxvW6HyQnTJ4dBVOtRbQuJdLAH69onS17cUUZ+B72bEBRMo1IlEeSXS2QI
         UxwA==
X-Gm-Message-State: AC+VfDxOL7r+IyyOLzz8KSmB3VHjKURm6pBmPVSS7b0A5mB9PtFN/pLn
	8r5m7+Aq3NaGMT8UduokKEEQ4rYdH1gWUVf1Fm1HV3hmZK4RC6A1Yi8=
X-Google-Smtp-Source: 
 ACHHUZ47NtoPMe/ZCoHI2xb+k272V1Xsn3CKyrz27cZUyKG05Lq+xhJqk6jUrfCIPPr7i9V6XGMAMA4Xai48KaBd7RQ=
X-Received: by 2002:a1c:c90a:0:b0:3f8:c9a4:4998 with SMTP id
 f10-20020a1cc90a000000b003f8c9a44998mr10413685wmb.28.1688473050857; Tue, 04
 Jul 2023 05:17:30 -0700 (PDT)
MIME-Version: 1.0
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Tue, 4 Jul 2023 14:17:19 +0200
Message-ID: 
 <CACMGZgY9SLGJ3d+66DxXwddwh2LTw3BXeEWUBGN=7fyrO0QkeQ@mail.gmail.com>
Subject: snd_soc_dai_ops.startup called for all codecs
To: alsa-devel@alsa-project.org
Cc: =?UTF-8?Q?Radek_Dost=C3=A1l?= <radek.dostal@streamunlimited.com>,
	Martin Pietryka <martin.pietryka@streamunlimited.com>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: peter.suti@streamunlimited.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XEEW4EJKTAXSIX2E3WLUZ6VFZ4ZWFSYO
X-Message-ID-Hash: XEEW4EJKTAXSIX2E3WLUZ6VFZ4ZWFSYO
X-Mailman-Approved-At: Tue, 04 Jul 2023 15:52:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEEW4EJKTAXSIX2E3WLUZ6VFZ4ZWFSYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I'm trying to create a sound card which has two codecs associated with
one DAI. One codec is responsible for playback and the other one for
capture. I can see in soc-pcm.c that
__soc_pcm_hw_params() is checking if the stream is valid for the
current codec with
snd_soc_dai_stream_valid() and if it isn't it is not calling the
hw_params() callback.
But this check is not there in __soc_pcm_open() which calls
snd_soc_dai_startup() for every codec. Can someone shed some light on
this? Why is startup() called for codecs that don't support the
current stream?

Thank you!

Best Regards,
Peter Suti
