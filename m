Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5B44D9C98
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 14:48:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6A201755;
	Tue, 15 Mar 2022 14:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6A201755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647352126;
	bh=fRJlJ2rTlGbHVaOXA3a7TjCvA+HS99/1cpEvFviB4uA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nscRr9Jvo5oUABctPEYCmlyXR//gjdLXu3zmKaxLU4Gl4sLZn0vvZ8lwRF61JIXJb
	 pNW4BnS4WjfbDxipspD0aYGdWZgRN1jGXLE+DUyU6Cx2RTSMt8+slb4q5goWmEsTPn
	 mAhatGRE09ZD1PsSAcvq0ssjdmsuTCv2IujJ4tO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0140BF801F7;
	Tue, 15 Mar 2022 14:47:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8345CF80162; Tue, 15 Mar 2022 14:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 277C6F80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 14:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 277C6F80095
Received: by mail-wm1-f46.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso1541571wmr.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 06:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cUb7Ym7YiBit1oW7mIGdDtc855Srmaz5LFm1bk92JDs=;
 b=KBGrT2IhqL94/lS+d7VtgcJ9dfofDUizB6vjRLspvmWLz3NF9BI6EE44RvHYVKENpZ
 q6iKMrHymJ5zOjNloGnj8tuogzBdwOWDQY43WuRIyiCFguD/UIeqpxEi/ndWMkpFCXVu
 Wz04nrKJ1Kk7jgM+dDbMMaRFlv8Dsp+usJoPNdgJBHFRK4BxSIujSgnzj6LG4hdMivmp
 DIN/CJX49eToucO2w2qwwj3yQ2XIDjvpgGpEi7dBpXC6qDDNRjyEUabMXzFH2BXENUR3
 n2mLCuhh4ZYELAVzA007oQxmGOXfNcbm3SJCra9cfeC2eckelxVfHw2lt0QWfyuDl4VG
 6f/w==
X-Gm-Message-State: AOAM530JXvJmmaxQZrO/1rzc8pC2Ay0SXes7TEh+cbCMPI0mJjhbnNaB
 bgOuUQfnUM8PrRs5f8ZBDlg=
X-Google-Smtp-Source: ABdhPJytT3AnIUgNmrWcCS6eglCCV+Fc0mjQURGc3W7lyrFTalBhR8Aju7XTZqMSC2tY0lfe/6nBxA==
X-Received: by 2002:a05:600c:4f47:b0:381:6c3e:19dc with SMTP id
 m7-20020a05600c4f4700b003816c3e19dcmr3423857wmq.155.1647352055447; 
 Tue, 15 Mar 2022 06:47:35 -0700 (PDT)
Received: from [192.168.64.180] (bzq-219-42-90.isdn.bezeqint.net.
 [62.219.42.90]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfe7c2000000b001f04d622e7fsm15562748wrn.39.2022.03.15.06.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 06:47:35 -0700 (PDT)
Message-ID: <90024a31-ea50-74fa-1ad2-db6c1db99fef@grimberg.me>
Date: Tue, 15 Mar 2022 15:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] [v2] nvme-pci: disable write zeros support on specific
 SSDs
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>,
 Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
References: <20220315132059.12747-1-mark_hsieh@wistron.corp-partner.google.com>
 <20220315132202.GA12452@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20220315132202.GA12452@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Mark_Hsieh@wistron.com,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, axboe@fb.com,
 kbusch@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>> Like commit 5611ec2b9814 ("nvme-pci: prevent SK hynix PC400 from using
>> Write Zeroes command"), Micron has the same issue:
>> [ 6305.633887] blk_update_request: operation not supported error, dev
>> nvme0n1, sector 340812032 op 0x9:(WRITE_ZEROES) flags 0x0 phys_seg 0 prio class 0
>>
>> So also disable Write Zeroes command on Micron.
> 
> This still ignores all the questions I've asked.

For some reason I cannot find the original patch(es)
