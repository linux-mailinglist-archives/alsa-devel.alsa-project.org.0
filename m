Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95D5812D0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 14:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FC8F1F2;
	Tue, 26 Jul 2022 14:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FC8F1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658837228;
	bh=uYoJwZzg6torWQ9m5Z55g8y36Jc8deIT8MNaJrqjBv0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=paJ69B4eDugEceDF5V/ZowLe0Ttyhyb5QbTdWn78aOE4SpQqV+dcf/yqMZCNpxnE1
	 dNMLn9V9jN7MOl4gR+gTZ5SyQhNVZQO5f7wPPoSX2F0cVgY7l9xbkoWnD5QGt5jsSA
	 kv39H06ZUzHygi6XyJ57s0rvVigDyHQOFeQYIZDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5CE8F80238;
	Tue, 26 Jul 2022 14:06:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51A99F8025A; Tue, 26 Jul 2022 14:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBB38F80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 14:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBB38F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZFoGF87q"
Received: by mail-pg1-x52d.google.com with SMTP id f65so12939399pgc.12
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 05:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=GRV637Y4Hq+GGIQkkjEXQ8JU+rviL8vESxDwxmAB9Hk=;
 b=ZFoGF87qKm+mERgACU9Ei0+Q4qsMDe8+CRnpRTtbxU4Cjj0BSuj1h+p7no8kATvKGL
 eQIX/TqlRkzwWT3LhDMUwoPJT6xJ4SrFhNmdSo/QnpC1mIIQojShEGZnrgQ63F7TqPsC
 F1aD8d6ctM3tcnMhx3mQx+yYXVH+SC465hblS8G9z5ZkHsEHQ6BQLJAa6/Js14T4DhfS
 Cdppo+U/hZ3jp10FRKbYf+GAZFj1AgT97xx8kF+dTavBoZvKLgccN7SffflAF+EOVw/N
 QT1ClkvaSxzYdIoEAj7dLQdk5eVd42+QxBKEX0BWC6DdqDFk6kSwKijSFLo6wyhpxHTb
 BKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=GRV637Y4Hq+GGIQkkjEXQ8JU+rviL8vESxDwxmAB9Hk=;
 b=1i3XUV2ImbwL+5rUsEparb9im1NowbUKYMPYuL15znlS0p3EyH6A4Stf3hpZWqdhIs
 PbgtVmO0THs8YAvi0KHjquCqftmn8nzIitIcQP/O2WLXuuaiZ3j6pf8S267726+U9Yft
 E+N5US/sXOyKFywgW1xH6jHyPSEXbulk7GcDaFeWnS0XaeWLlMFKXnnn4RkCc+/ygRDD
 czTrG+P6qWn1t2UAkJZIAhVby1LC2u7l5TUlsxZX0ISmavvs8V8Yl/lQnEus1nQCW1vn
 Dpa/Qde9rP3luPjwClf33LZJOJbSSYoBeACjX5Mtt4QOirLtiAJtdpgDl2aDYO/SP8k/
 tscQ==
X-Gm-Message-State: AJIora8uSoGOtPEdl87LAPATtA60qI+yncNHnCRA1WpKgLdWao1Z1A0b
 JmlG4iiW/9lCTakfje9yFwT1+2YUtsbtrh8LPDk=
X-Google-Smtp-Source: AGRyM1syNQBGIKS83yy5jTR3x5LVqL7/qutl2fGV86mKR8MSC71R7on8Rvy9Eyuda7md43aw8EQ4zQ==
X-Received: by 2002:a05:6a00:1a92:b0:52b:ac3:7964 with SMTP id
 e18-20020a056a001a9200b0052b0ac37964mr16890978pfv.31.1658837160065; 
 Tue, 26 Jul 2022 05:06:00 -0700 (PDT)
Received: from a-VirtualBox.tendawifi.com ([101.224.225.209])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a1709027fc900b0016bb24f5d19sm11459842plb.209.2022.07.26.05.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 05:05:59 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 1/2] ASoC: codecs: add support for ES8326
Date: Tue, 26 Jul 2022 20:05:23 +0800
Message-Id: <20220726120523.127134-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726092058.GG92394@ediswmail.ad.cirrus.com>
References: <20220726092058.GG92394@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, ckeepax@opensource.cirrus.com, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org
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

>> +	.use_pmdown_time	= 1,
>> +	.endianness		= 1,
>> +	.non_legacy_dai_naming	= 1,
>
>The non_legacy_dai_naming flag has been removed, you will get
>this behaviour by default now.

Do I need .use_pmdown_time? Is it now enabled by default? 

Thanks
