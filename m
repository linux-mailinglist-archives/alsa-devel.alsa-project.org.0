Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3354854F2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 15:45:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00CEE1931;
	Wed,  5 Jan 2022 15:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00CEE1931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641393920;
	bh=KOa7OfHkYV1QuKFQb7TDkARN8bdEbjPX9Rn1pC+XLW4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVa5KZcU4YeiK+a4AVbLejqnuA+I/c2aJEOqpCuzoH5h9eIo0R3BT9IA+Ygf/I1oT
	 gAH2hnawsNW42FrU7MAuTQvyw7tYngbgKQnmxYCi5XConcLRxiMrW6wt0+fL9mUkwF
	 kDL/KF/Q5aFZzhWQnKlQCIdmJ/6d7wV6n3xRBqM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A7F0F8020C;
	Wed,  5 Jan 2022 15:44:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89248F801D8; Wed,  5 Jan 2022 15:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E398CF8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 15:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E398CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ggPejQ+4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205BpCgh020067;
 Wed, 5 Jan 2022 08:44:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=JtM8XlNE8jS3ESrEB/vt/isdtCnCkfKIi50WYQ34oi4=;
 b=ggPejQ+4jwitwT8zPzs2O1bSHQsgGvWVao55wzn+K7sGWKdqRLB9TKgcrNmd5DyNLuPD
 dlOgrA5kJitXPeAH4fMCH43vL5yKvAFxmzvX52YL2vtP4xRZEhDWdhmj371RfJOFpGZW
 sqXf5JinltCjX5hP62/btUd8ozMXCFkB2pzvcCcaNfKSuIq5aY5LCcx00wfrXQbbOfRN
 MBKJjfvc+F9xQTMKzIeIVWjTNx95GwQs9jAAisG5Nfcyhlq67pDcmSHb4h0WEB4JhFLZ
 qY6Jgiqr61y8RCcUYCW6wNGYk5U7RH9Q1ksDaS3img3Xm3gHnTbaTsWpKwALPWfwi1/a 0A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dd8jy88r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 08:44:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 14:44:03 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 14:44:03 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D701B11D7;
 Wed,  5 Jan 2022 14:44:03 +0000 (UTC)
Date: Wed, 5 Jan 2022 14:44:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/8] Add low power hibernation support to cs35l41
Message-ID: <20220105144403.GG18506@ediswmail.ad.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
 <YdWrhS557UTykPY9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YdWrhS557UTykPY9@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: f8SPmSySFz2WocF-AKgZooPakCP3OfOP
X-Proofpoint-ORIG-GUID: f8SPmSySFz2WocF-AKgZooPakCP3OfOP
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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

On Wed, Jan 05, 2022 at 02:30:29PM +0000, Mark Brown wrote:
> On Wed, Jan 05, 2022 at 11:30:18AM +0000, Charles Keepax wrote:
> 
> > Patches 7,8 specifically will cause some very minor conflicts with
> > Lucas's currently outstanding work on the HDA version of cs35l41.
> > Whilst things will still build, this patch adds a test key function
> 
> No they won't, an x86 allmodconfig gives this:
> 
> ERROR: modpost: "cs35l41_pm_ops" [sound/soc/codecs/snd-soc-cs35l41-i2c.ko] undefined!
> ERROR: modpost: "cs35l41_pm_ops" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
> ERROR: modpost: "cs35l41_test_key_lock" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
> ERROR: modpost: "cs35l41_test_key_unlock" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!

Hmm... apologies, let me look into that one.

Thanks,
Charles
