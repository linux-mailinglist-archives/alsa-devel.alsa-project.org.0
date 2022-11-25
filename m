Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD190638C04
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:22:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2A82173A;
	Fri, 25 Nov 2022 15:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2A82173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386143;
	bh=DlIikT6FuCK/nkJwV6a0WupNcwgFsBF3r1LnaGy1yic=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lCaFhtYPLk3de5vc4mX8rWq7DHw2HMte3f400HQpF5GiUo6SZDRLtduXQTbKwO8QM
	 LqCLgawxbEa88yZaAAWDriWpN5VLUFkcXETP9SbrumLT3XUAPo3xG1DUQqVj08/Hpx
	 d/O7aZ0Ipz0KKa1DbjEs/kPvMthktaWdgcBU1+g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBD3F80558;
	Fri, 25 Nov 2022 15:20:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4FF2F80559; Fri, 25 Nov 2022 15:20:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92DFBF8047C
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92DFBF8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VoixvH6U"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2APCp6w7007040; Fri, 25 Nov 2022 08:20:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=mDzk+uY23FTNoUUYh8QvKniEEsfAMyybDRWMvyjLv68=;
 b=VoixvH6UYkJWptdkGMR6/AM5bk/uA0XnzVaWxNtJ6St+da8PP5ya0WxWEZGtauc32vN7
 tNj2GQKHjIC0zTnu2bpSuIHZycp1aAXcoL2O2hlwH5NUbTK3Ss0wvG8Iy1OKchiWIn+S
 0k/ewBvo4y3UjOXKQe3FFUJtJorK/65opcs9+Ot3rdzFbG7cQZ7zzmWdnM/ru2Gfoue5
 WrejCfKvOpj2y9XBWXd2xlrexhDJZftdNCun/YKjE0c2Smu+sfFMUXFtU7TD/DgZpV72
 d89Smo9EHLdM2qT+jk2Dv0BQ1o81n7iKjp9JLd77x6CKieFiVX+3n9PpuKX4K3/brGZw jg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet7ccn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 08:20:31 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 08:20:29 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 25 Nov 2022 08:20:29 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 005522BA;
 Fri, 25 Nov 2022 14:20:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v4 0/4] Minor SoundWire clean ups
Date: Fri, 25 Nov 2022 14:20:24 +0000
Message-ID: <20221125142028.1118618-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2JtisvnBNqiy_et9YRgZfhIVEesJvxzi
X-Proofpoint-GUID: 2JtisvnBNqiy_et9YRgZfhIVEesJvxzi
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

Just some minor tidy ups and preparation for starting to upstream some
Cirrus SoundWire devices. The first three patches are pretty trivial,
the last patch which moves the remaining core over to using the no_pm
functions could probably use some careful review.

Changes since v3:
 - Return an error and add a WARN_ONCE if the build stubs are used.

Changes since v2:
 - Fix up a memory leak of a buffer on the error path
 - Added some reviewed by's

Thanks,
Charles

*** BLURB HERE ***

Charles Keepax (3):
  soundwire: Provide build stubs for common functions
  soundwire: debugfs: Switch to sdw_read_no_pm
  soundwire: stream: Move remaining register accesses over to no_pm

Simon Trimmer (1):
  soundwire: bus: export sdw_nwrite_no_pm and sdw_nread_no_pm functions

 drivers/soundwire/bus.c       |  10 ++--
 drivers/soundwire/debugfs.c   |  13 ++++-
 drivers/soundwire/stream.c    |  30 +++++-----
 include/linux/soundwire/sdw.h | 107 ++++++++++++++++++++++++++++++----
 4 files changed, 129 insertions(+), 31 deletions(-)

-- 
2.30.2

