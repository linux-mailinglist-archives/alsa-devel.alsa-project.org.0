Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956570A658
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 10:22:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147CC82C;
	Sat, 20 May 2023 10:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147CC82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684570942;
	bh=DIrenhBfdJ9S1GglddRp7FAjwWj6W9avRM9R/GOtq4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m31WciUj+hkRCAB90MvcJX5ZJmem8OVwYIKWI1a48VZvCvRbY8Hs2moLr/RLhuF35
	 psvnQSzvaOLprXpCT62IxATD4gK/rpHxklsUtKatWFlde2npfm1zw1ZQ1NqucRMMIi
	 fpPOhIzTipf9MDx9c6ZjvItyJ+8Jqct7fiIcap2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 891EFF8055B; Sat, 20 May 2023 10:20:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2719F80548;
	Sat, 20 May 2023 10:20:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E35CCF80272; Fri, 19 May 2023 23:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7A55F8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 23:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7A55F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=S6JW210S
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64ab2a37812so942673b3a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 19 May 2023 14:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684530869; x=1687122869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIrenhBfdJ9S1GglddRp7FAjwWj6W9avRM9R/GOtq4o=;
        b=S6JW210SimyXQteMWDUCvnrjqHSMWR9FlhpN6Gfp8JzEhWQsc/oawiq3wLPDUZA9vK
         fBzaGKtIlZ1TIUeiQOm/SdN98MjUGkNdW6mOGMb0VAT6a0zyW2oHeScXhM0vALh+Q9U3
         00mdNeGsdjXBsYWyVisypxU/dTZ9sqejCiOYtl8Yoo1qeB34jnmBlQc7G8w4j360jsvZ
         F9J0YoUVbuFUPYidnTyV4facw2EVUg69OJ7nZPF3ksqC+/ZCqa/GPlgzFKVbuQvzC0xB
         o32Kl9kUzd/oXbLVJgkO4+94p4BtGxG8bunOphyLZtgzG8WhvpNbFFFqUEFCv0HgftpS
         QnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684530869; x=1687122869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIrenhBfdJ9S1GglddRp7FAjwWj6W9avRM9R/GOtq4o=;
        b=YnaRE5PvUPpQBaMml6zvOljNQXv0OEQ9RHd/Q1ltSRzgVQhQZsMWSPtNtpoSe30SJ3
         NN3Eb5jTK9Z+0K1xiY6RBENSS2RdDwL3NmyPNUt8onWSIeuBrTTF98Vmf/OMlxwyyOgB
         NhvD6nhD2teO7okikvx725ARkgvF5MwqA2DbN8QQijjMb30r9RQfiRcU4WxjLXSOy0ql
         9Tq1epd2E5lwPBxbYKuzFfbzJcVYmzoF1XTTsLHmsMPB6cb/VpDn+0siPRkqpCnw7AoK
         XyhPllqen89AIz82SXLSmIBdX8aJmuL1SvFv5pYizucM/TIwYsWH6EpqX5ExskAF4NpH
         j+4Q==
X-Gm-Message-State: AC+VfDy7P+ewcuQ3JEDkSWTXnikA7XMJ1aY6+5CKWopTkJmYKH/veVwJ
	UDawrz7WCAtyBOruevmC3oc=
X-Google-Smtp-Source: 
 ACHHUZ4dMVRliZxns6wTFOga0mP6iABSlp+aoUohWPu+fMi/VXG6CHEbD8VZs/+6Pm/X/5KPWjTHJg==
X-Received: by 2002:a17:903:183:b0:1af:98e:5b9b with SMTP id
 z3-20020a170903018300b001af098e5b9bmr673080plg.10.1684530869217;
        Fri, 19 May 2023 14:14:29 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28])
        by smtp.gmail.com with ESMTPSA id
 z2-20020a1709028f8200b001ab0159b9edsm54318plo.250.2023.05.19.14.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 14:14:28 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	minhuadotchen@gmail.com,
	perex@perex.cz,
	peter.ujfalusi@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: ti: Use pcm_for_each_format() macro for PCM format
 iteration
Date: Sat, 20 May 2023 05:14:24 +0800
Message-Id: <20230519211424.3381-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZGV9m6KbuIMWOX13@finisterre.sirena.org.uk>
References: <ZGV9m6KbuIMWOX13@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: minhuadotchen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RHZBUW2LUJB642J6YLG2PMH5W42XC74N
X-Message-ID-Hash: RHZBUW2LUJB642J6YLG2PMH5W42XC74N
X-Mailman-Approved-At: Sat, 20 May 2023 08:20:39 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHZBUW2LUJB642J6YLG2PMH5W42XC74N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

>On Thu, May 18, 2023 at 07:42:15AM +0800, Min-Hua Chen wrote:
>
>> Thanks for your comment. I think the subject should be changed to:=20
>> "ASoC: ti: davinci-mcasp: Use pcm_for_each_format() macro".
>
>Yes.


ok, I will submit v2 for this.


cheers,
Min-Hua
