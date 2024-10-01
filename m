Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9998B95F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 12:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09848B60;
	Tue,  1 Oct 2024 12:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09848B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727778126;
	bh=y65lFrQ7qFv0f4z7Y5f4qpT/KszQbEugL8i/gim+Sh0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k9JkS5m/jUsPoXR6WaKLKhwBhAyrOP8iPgu3zqgEsUPzrCrurJea+tbnp/y6Jre2S
	 +EQyY3Ji1URn8snvJLN9i+z/z9/dBgUZ77Ncs6ka50LRmFBMQ5wOJED57kYaUEDJAn
	 tQ+2BDeKa7RoGElrm04AjKQkLVmB0pXqsycxUFcI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45AD9F8057A; Tue,  1 Oct 2024 12:21:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC727F805B0;
	Tue,  1 Oct 2024 12:21:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA61F80517; Tue,  1 Oct 2024 12:21:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3E88F80104
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 12:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E88F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GFiZh73Q
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4914p1kI020671;
	Tue, 1 Oct 2024 05:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=otL/gufLRtLQBt15we
	pTG2Feg4kPsB3DBkhFa7Q9srE=; b=GFiZh73QwOwEmeQCHohM5bJT5xxgZXTFFy
	Tm7WZDwUSb/yefGgQ7tIjy7D1zFamKD5s110CqpQLYQ2FRJklFqrktteqHkTFwcu
	/2/Trr5WGvbpEx7y7OP8b13HCIz/LZANRqqiqa5Q+9QJZZOUHCsIqtDk5xuxbuHe
	ptRPDqZeE7L1g+DrDO+W5W2yuxNWyjh965XEGQcVRKn05ivS0r7WxUGyntWG7rUA
	1Q4h5Zn3aDDVFnjNDpLUspOSlBjkIchxooYQImVm0SfXklb33IacDWyoCTBC1TqI
	jJHTilD+DrUZ/URDj4caAQsqnVJq9B7v6ax9es5NBc3wABd0F0dQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41xe7ju6ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 05:21:18 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 11:21:16 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 1 Oct 2024 11:21:16 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 9F67D820244;
	Tue,  1 Oct 2024 10:21:16 +0000 (UTC)
Date: Tue, 1 Oct 2024 11:21:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH alsa-ucm-conf 1/2] sof-soundwire: Change mapped control
 names to make them unique
Message-ID: <ZvvNGy2P9/PkMrY9@opensource.cirrus.com>
References: <20240930134118.2640509-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240930134118.2640509-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: iNaavoqS1scDsoFW64Umh6bGocmBZ4Fs
X-Proofpoint-GUID: iNaavoqS1scDsoFW64Umh6bGocmBZ4Fs
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: V3MZVZZRMV4SKYCCHVRR4QDUKC2RQIZT
X-Message-ID-Hash: V3MZVZZRMV4SKYCCHVRR4QDUKC2RQIZT
X-MailFrom: prvs=7004ca106a=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3MZVZZRMV4SKYCCHVRR4QDUKC2RQIZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 30, 2024 at 02:41:17PM +0100, Maciej Strozek wrote:
> Both 'Speaker Digital' and 'cs42l43 PDM2' names were found as substrings in
> other alsa controls, confusing the MixerElems paths. Make them unique to avoid
> errors for hardware mutes. Also add 'Capture' string into microphone controls
> to make them work properly.
> 
> Fixes: e87dde51d689 ("sof-soundwire: Add basic support for cs42l43")
> Fixes: e4277a204cd6 ("sof-soundwire: Add support for cs42l43/cs35l56 bridge configuration")
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
