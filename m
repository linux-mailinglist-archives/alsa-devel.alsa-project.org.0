Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D0974376D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 10:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E03F93A;
	Fri, 30 Jun 2023 10:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E03F93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688114197;
	bh=MrF8jN5bYTANHiVjk88XLQGQd876v+6zZ1QWdJGX/Vo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FywuZ1+xuonnFuIIejr8ex/wvnB8TD5DUfW25fnUVlrQK+EJYw1HUiC9qcQ8ghKjJ
	 KHX3DYeoXh+L7cR7OE2GZGPm4GnCA67481JQ5qHvSQHfFBJQy55Yt/nX07IELDxxmW
	 fyN+R3D4b3Z1g+qICnaKKbZLV7dEBbi+dgBt0zkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1EB9F805B4; Fri, 30 Jun 2023 10:34:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 428C7F805B3;
	Fri, 30 Jun 2023 10:34:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2411F80246; Fri, 30 Jun 2023 08:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E48A4F80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 08:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E48A4F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=SXvR6b0K
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7836e80b303so65697939f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 23:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688106821; x=1690698821;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5b0i9/cx4VxRuAoKXFWc4VsBJEpIztDNaYvchAm7FQ=;
        b=SXvR6b0K6CvjOC5euZj5vFTBBoaTnEDjNmnSLkPxZ7+r5lhSbuZdfN99K2/Y9TS+Uy
         7WTuhS/uH6G5gydbRMohW7q6OuQ/gwcRewFSqln7lBIMX9QRpkKDUmBvIiTHK/AKvHFK
         IqmrsxmZs7bUxNo7l/mFGJNSlefv+ol9LQUuhMqu8lq2gCANcTSuQl2Si3Jr5XerS/XO
         znb7dLr3ddKgKfTp38fYhzcNOQS377epWtnDpHkeMfAlIPZdFRZOboP6JQK5SNabmF1+
         D9friwTaHB3DzBUKA0hK7s7CzMe6NSorpX2hXBipj94ryxHMuBbquh803wCRK8fQZM/+
         IfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688106821; x=1690698821;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5b0i9/cx4VxRuAoKXFWc4VsBJEpIztDNaYvchAm7FQ=;
        b=dlrFY+aU6sdPO+x60pFmun5uDIMNgSpHkqMnGSnjB0rm0ArpS2aNe9u96dacHjG79M
         tA9+jt27wLh5WiyXWd7WS2ixwyNkEocIauTDNcMy7Zwdt5RDMzMIu0ge9FWbbKmJEIXf
         DSW1noVpjSdM1yCnYjZEn50sSd0Btg5N5PmEQWLHXrtMNHav+3xSs2GbdxPmkZHJAZgD
         r+gR0c1hAR1xPEI/yRz2PjrrBejcLfOR7Ce8c5i//67qvwwgaCxhhIOIPHCFALYvWQuJ
         idUZlYJrCHpHkoZD5hmcoTedFBRkr8RRdW+qdJ/yBDc3BN3F8UJdxFSY1PSJtGMKHHQk
         oICw==
X-Gm-Message-State: AC+VfDwHrCw4EQClDqhyKbi+ZTKhwUmuCyY5VeIouax7kl5RUHiecC/i
	zPQPlxIYhH1yw+jYNOpcPdM=
X-Google-Smtp-Source: 
 ACHHUZ4Md+L4emj1TGsRiElmzzl2iz6HJ3XsMkiMyrSCDMWaZsj/7srUBXb1UsliVDwH0BQ8L9qU+w==
X-Received: by 2002:a5d:96d7:0:b0:783:7193:b019 with SMTP id
 r23-20020a5d96d7000000b007837193b019mr2028043iol.4.1688106820664;
        Thu, 29 Jun 2023 23:33:40 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:7b10:d8bb:7655:ba58?
 ([2001:470:42c4:101:7b10:d8bb:7655:ba58])
        by smtp.gmail.com with ESMTPSA id
 p22-20020a5d9c96000000b00785d3921f56sm1875060iop.7.2023.06.29.23.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 23:33:40 -0700 (PDT)
Message-ID: <875080d0-8771-c47f-a86b-821fe33301b0@gmail.com>
Date: Fri, 30 Jun 2023 00:33:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: pcm/Intel: Handle IPC dependent sequencing
 correctly
To: peter.ujfalusi@linux.intel.com
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com
References: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: cfsworks@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2AE6ONGV32RBFPR74XOB7VR7B6RSWXJ5
X-Message-ID-Hash: 2AE6ONGV32RBFPR74XOB7VR7B6RSWXJ5
X-Mailman-Approved-At: Fri, 30 Jun 2023 08:34:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AE6ONGV32RBFPR74XOB7VR7B6RSWXJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi folks,

When I upgraded my system to 6.4.0, I encountered a regression in audio 
output. In regression testing, I found that patch 1/3 here was the 
culprit, and the regression goes away entirely (on 6.4.0 final) when 
applying a patch that reverts this whole patchset. The problem is 
currently still unresolved even in broonie/sound.git.

The regression is an intermittent (few minutes on, few minutes off) 
distortion in audio output on my Tigerlake->ALC298 path. When playing a 
440 Hz test tone, the output spectrum is distorted into 440 Hz, 560 Hz, 
1440 Hz, 1560 Hz, 2440 Hz, 2560 Hz, and so on. Since this is the exact 
spectrum one would get if the output were modulated with a 1000 Hz Dirac 
comb, I interpret this to mean that the audio subsystem is dropping 
(zeroing) 1 sample every 1ms.

There seem to be conditions for this problem to come and go 
spontaneously -- in particular, it won't happen if my nvidia driver is 
unloaded. However, I can make it occur (even with no out-of-tree modules 
loaded) by sending several SIGSTOP->10ms->SIGCONT sequences to my 
pipewire daemon while it's playing audio. The distortion then continues 
until I send several more signals of that same sequence.

Now, aside from having some DSP background, I'm a total outsider to the 
ALSA and SOF world, so what follows is mere speculation on my part: I 
believe the problem has some probability of being "toggled" by a buffer 
underrun, which happens either deliberately by briefly interrupting 
pipewire, or accidentally due to bus contention from having my GPU 
active. Something (userspace? ALSA?) tries to restart the stream in 
response to that underrun, but this patchset makes stream stop+start 
more of a "warm reset," in that it doesn't clean up DMA. As a result, an 
off-by-one error somehow creeps into the DMA size, thus omitting the 
final sample of every 1ms transfer.

I am not sure if this is a regression introduced with this patchset, or 
merely a different bug that became apparent now that DMA isn't being 
reset when underruns happen. If it's the latter case, I'm happy to open 
an issue on Bugzilla instead. In either case, let me know if I can 
provide any additional troubleshooting information.

Cheers,

Sam

