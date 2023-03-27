Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A789B6C9DED
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 10:34:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 762D4839;
	Mon, 27 Mar 2023 10:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 762D4839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679906055;
	bh=arid1Pds8J44g/f+iQEj2r7lxSlRTyxg4VZDWF/zHRI=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=CLmN0FnddUOaldnaTeC3BivM2v1nERUqnDamWhiWOUITyytTz1NnXsfLlTY2qfeT4
	 nfW16yKcgzlrPtkZjbR4EGgHWJbiOVkq9DxIMNpLVXvgAC+ZLSWhS96ktitRYJTtcn
	 bMTbSjqD58z0zW4CjADefXEsVHTIGNXXSmrjYfSQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31BE4F8024E;
	Mon, 27 Mar 2023 10:33:25 +0200 (CEST)
Date: Mon, 27 Mar 2023 08:33:16 +0000
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 0/1] Implement DMIC support in WM8903
References: <20230325083643.7575-1-clamor95@gmail.com>
In-Reply-To: <20230325083643.7575-1-clamor95@gmail.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJT2WCYUNDCLS5VXCISKSPLWWJBVRJWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167990600462.26.2603174805591404915@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 975B5F8032D; Mon, 27 Mar 2023 10:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35142F800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 10:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35142F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=kjidK2YP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32R6sIwq002016;
	Mon, 27 Mar 2023 03:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=+f6AXv/9wpIrc9ZyOdHQ1UKnx/Y/J05TC0RiqzcnUnM=;
 b=kjidK2YPzNZfPUNSZzO+gnRfDOmJ6YxgQaZZDb3ZZmfPB5S2oeedeQFQvnM8VXVgHKnA
 8YQtcJSrG9oKpGpGj3xROU5hQZX3I8eZ1v40YMU8Oo973ubh4S7G8NkOXrcHhYhxAPlj
 snEqgIXBgN7ub48DFhiSncMVS+oOSEMTzDRwI1D4sN/kFKo9UfnV9zONFzAvLvz615CL
 I/UrEH/+2rCj/pgHfL47FmCl4NtH1LIFsAEkyhunZOQl7yhv+AUSS3Fiiq84kLO8dgD2
 rXzUFrXAFD0y/mnkoaYqM7oITExD6WilDac0uhZvimTKTN9cJRr+4+lX9UnBLEwtdxhq Qw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3phxc2j69w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 03:33:18 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 27 Mar
 2023 03:33:16 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 27 Mar 2023 03:33:16 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2B7AD11D3;
	Mon, 27 Mar 2023 08:33:16 +0000 (UTC)
Date: Mon, 27 Mar 2023 08:33:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 0/1] Implement DMIC support in WM8903
Message-ID: <20230327083316.GR68926@ediswmail.ad.cirrus.com>
References: <20230325083643.7575-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230325083643.7575-1-clamor95@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: eetdR_vAdnT96ZJC8FnuOBaPDqQwnFL_
X-Proofpoint-ORIG-GUID: eetdR_vAdnT96ZJC8FnuOBaPDqQwnFL_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WJT2WCYUNDCLS5VXCISKSPLWWJBVRJWY
X-Message-ID-Hash: WJT2WCYUNDCLS5VXCISKSPLWWJBVRJWY
X-MailFrom: prvs=845006f82f=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJT2WCYUNDCLS5VXCISKSPLWWJBVRJWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Mar 25, 2023 at 10:36:42AM +0200, Svyatoslav Ryhel wrote:
> According to comments in wm8903, driver lacks DMIC support.

Which comments? I am having some difficulty finding these?

Thanks,
Charles
