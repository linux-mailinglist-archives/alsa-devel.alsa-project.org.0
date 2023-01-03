Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E93E865C4C8
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 18:11:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F1E2D7E;
	Tue,  3 Jan 2023 18:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F1E2D7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672765895;
	bh=RptTEU2cLYChzm9C6z2QKss+R/qu2gMjygZb54qWdjQ=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O0uUZ5hrVtnylUno4BPCVP73FKNUs/uCYPUawybyF7zf68DIyEtc3fERY7b9s8sOS
	 PtD4eJDIrQ8qrL0OfsVi+yez9Fprj5BgIzZ+bm7RhfBwaEpeuMvi6V/PC+iHiitNsU
	 oqwyZGOT4S41U9gAlNWd7lt3OO+ds/loq+92I7cY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82DA5F804AD;
	Tue,  3 Jan 2023 18:10:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 641E9F800F8; Tue,  3 Jan 2023 18:10:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9021FF800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 18:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9021FF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R2ZBENni
Received: by mail-wm1-x32d.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso23954064wmp.3
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 09:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:content-language:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DxU00yrA+Sc2ZL2bKk8Pv8ejprrUz0uN45A5QU4UU48=;
 b=R2ZBENniiMnRU5DfA2gvq/TT/bOJqGrS3jI5F+2KCPuYK5QewHqDBAMCTnZTUybKRH
 gryFdbjAUDsKrkgqhA+TxS0jfI5qMyl1y52aaZtBUO9djOJAvDoHnvPRxw//LHyIDkh+
 BGz7hC/loMHq/DE6x0jB6+RrdyLyszrwUT2D6dGh5XAW2PgXwdZwxqyjU2g2hF6oyNFo
 Xhf/1HsGOCDsDoQhlbtNJbIVfiNiNz/zTWvKxSvwg/XrtlO8CEWt/D4O8AkPaQ4BzltY
 wgHVvccf6aBtLTercUEgTLkEOw9XqdqedZa6aSnjX5Hs8sX8rPvZnkzsSgdwJqlHBsZo
 LW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=subject:from:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DxU00yrA+Sc2ZL2bKk8Pv8ejprrUz0uN45A5QU4UU48=;
 b=MQppYx60zmI+7jmVt+35MflRqSW+ZPXtr0aZ9E5Xq6f8xlHLg1xpMFo/EbP2lH+I3S
 4rlXZY4D10ReixnZ58XVWB9XfVmg4o8e/vwOT35aHwJ+3RRA2hQFQZYs+gmfrJjaLU/1
 cw+mA3KEBHXja5n6llXEqG0xQ8GpdD7VeE5kmmRyVfryTlaH34fltcNJyockEpn77PpN
 y7VwagqwkDmeI7AHzVhFCrB51BKzxNE5Xykdw8JqihSTGpZm/f7ZHZNk1QL4NCq9W+sz
 EFMNiepDpSMLryx+6RphNMpQThZ9WixAfv3OZEJa5SdTkwFGjYIkWurus/RAW8UmSave
 aiMw==
X-Gm-Message-State: AFqh2kpTzRv6DldL58tcYms6wluY8NlgHewm30LHcjETOfSZhqXxgG11
 5V7MFI3ery2YR0oeG/jNOGifjc1rtog=
X-Google-Smtp-Source: AMrXdXt18pL8mtyMa+qjKemIvLwFSK/CVEJg0MU0EEMK+2Y+oo01+DloqZph04OnY7WJoD6yHovgww==
X-Received: by 2002:a05:600c:4a90:b0:3d2:3ae8:886a with SMTP id
 b16-20020a05600c4a9000b003d23ae8886amr35202644wmp.17.1672765839639; 
 Tue, 03 Jan 2023 09:10:39 -0800 (PST)
Received: from [192.168.21.204] (surfbythesea.plus.com. [81.174.134.71])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a1c5419000000b003c6c182bef9sm56202540wmb.36.2023.01.03.09.10.38
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 09:10:39 -0800 (PST)
Message-ID: <e4b850e4-6828-2663-5a58-49d44582ce3c@gmail.com>
Date: Tue, 3 Jan 2023 17:10:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: alsa-devel@alsa-project.org
From: Alan Young <consult.awy@gmail.com>
Subject: Avoiding 64-bit calculations in 32-bit application
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

How much do we care about avoiding unnecessary 64-bit calculations in 
32-bit applications?

I think I am going to have to submit another fix to 
pcm_rate:snd_pcm_rate_sync_hwptr0(). I'm not sure yet, but I think that 
the fix by /mahendran.kuppusamy@in.bosch.com/ can result in, at least, 
off-by-one errors in the calculated value. I have yet to determine 
whether the error is ever cumulative and the consequences.

My proposed fix includes (rate->slave_hw_ptr_wrap is u_int64_t):

+	if (rate->slave_hw_ptr_wrap) {
+		/*
+		 * Restrict explicit 64-bit calculations to case where rate->slave_hw_ptr_wrap
+		 * is non-zero, which will only happen in 32-bit environments.
+		 */
+		u_int64_t wrapped_slave_hw_ptr = slave_hw_ptr + rate->slave_hw_ptr_wrap;
+		new_hw_ptr = ((wrapped_slave_hw_ptr / slave_period_size) * period_size) % boundary;
+		slave_residual = wrapped_slave_hw_ptr % slave_period_size;
+	} else {
+		new_hw_ptr = (slave_hw_ptr / slave_period_size) * period_size;
+		slave_residual = slave_hw_ptr % slave_period_size;
+	}

so it only ever does 64-bit calculations if there has been a boundary wrap.

Is that optimization desirable (assuming my fix is necessary at all) or 
would it be better just to do 64-bit calculations all the time?
