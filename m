Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6989F9718
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2024 17:58:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB326023E;
	Fri, 20 Dec 2024 17:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB326023E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734713921;
	bh=16fUf83by1UJnBxQ19rnSXwQQkxEHYekg22nFhMt3b0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JnQrPxAMOoGdoaFPt7Co90GPQd1MC/DbPeggVKg9Y6x/+uiONBmo9Wap8eavztxhw
	 RIrhZ2W58cM5qnShiaryNG0klaSIES7ZnGe99pwHv8URrpThGQS/hDDFwQ5St/b7+F
	 lzWAbG9AGBUtWfo2n3XF05zKGVmzwFh77Q5elSsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B38CCF805C1; Fri, 20 Dec 2024 17:58:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F27DF805BD;
	Fri, 20 Dec 2024 17:58:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA6F6F80508; Fri, 20 Dec 2024 17:57:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52EDDF800B0
	for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2024 17:57:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52EDDF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Rw6fIc5+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4BK5WAcx021331;
	Fri, 20 Dec 2024 10:57:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=16fUf83by1UJnBxQ19
	rnSXwQQkxEHYekg22nFhMt3b0=; b=Rw6fIc5+wEJfaO7xvYcFSk1fTaCGLN/w+c
	jnDkqUDqdrgm+Pwfq5OXoA9HsjWLT5dTHgp3yziX7FjmWldbIgrbgx4ABC9/s4iI
	kV+uHNZPBJ8nk3lRupv36nkDw3Jk1YyQS4PGMyshan8RGqSIFz92Tgys7bfmruXB
	NDucqC8LzTs2ujOUwHFkn1Lwn/ndR9Sku2kVC8zhhT+x+95lZSs661S0sYSP2QSy
	K1OOj2cloBm6tyZm0M1GWlIrNxpiGS2Nl7W5opP8pgCaqpt57WMO1ofDDB/VuWV8
	AERPFMerOrIlWWakGT+z0mviYbYElYl4U4CQjwat3S8iRGWS3Fbw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a2855d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 10:57:54 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 20 Dec
 2024 16:57:52 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 20 Dec 2024 16:57:52 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 94450820247;
	Fri, 20 Dec 2024 16:57:52 +0000 (UTC)
Date: Fri, 20 Dec 2024 16:57:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [alsa-ucm-conf] sof-soundwire: Use correct speaker data port and
 PCM for cs35l56 bridge
Message-ID: <Z2WiD61p93c2qMAL@opensource.cirrus.com>
References: <20241220160851.275061-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241220160851.275061-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: NKFvREqLFBtghuvhCTHwQ2u5xGq_9g8C
X-Proofpoint-GUID: NKFvREqLFBtghuvhCTHwQ2u5xGq_9g8C
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: D23SBYUD7QEAXUEWIBH5UQP566SHWPQP
X-Message-ID-Hash: D23SBYUD7QEAXUEWIBH5UQP566SHWPQP
X-MailFrom: prvs=9084642130=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D23SBYUD7QEAXUEWIBH5UQP566SHWPQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Dec 20, 2024 at 04:08:51PM +0000, Maciej Strozek wrote:
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
