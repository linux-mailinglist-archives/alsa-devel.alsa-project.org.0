Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35583280AF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 15:24:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49F461698;
	Mon,  1 Mar 2021 15:23:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49F461698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614608686;
	bh=mvT4rBoPnXdaluqZeT/fjaOIBq3dT0HGPXsa0fl1Og8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AcgmWXXqa0PT0PFa7R1uQJf4xfqGnGZNiwaerFqKvMw4lECvGPcBcilhQyYbF6GnP
	 cPTcHr181eqCxU7LvRgQ4b8Jszcn6ZhU8/SUd0x2uhgXe3YnL31kBjqe4jOsM88lxO
	 nSdj2TCnmrI1sjb6kIq3pYG/Yd0A+tj3L/AsV2d4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0634F8032B;
	Mon,  1 Mar 2021 10:37:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70B2DF8032C; Mon,  1 Mar 2021 10:37:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22562F802E7
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 10:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22562F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="PZC1SrmU"
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1219NBol003692
 for <alsa-devel@alsa-project.org>; Mon, 1 Mar 2021 04:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=EM5BrDIMVQChc57nS9FKhnvWtBPZQxuDesoN5FM42HY=;
 b=PZC1SrmUH0uEHUWnDpIHNQABzojXvXcyAsd8LnoEVbBx6k9soD6KaOkPc7ZyrdI145ht
 niSMA1b3iUVEAc5yw6YmwAmHFtqIY9K1NXgpSkBIjScooBEcV0cfgSjUnGGBBpqn5bg9
 lwjFxTWTvtmZR8Aew+/RMntJ9BlbYIM8/nTU6/uiwoT8rdhEEbcSMc/e2Qr2u6wmBEB6
 MG0xGdxlazbACaElrRizs/lbMi5Qnv9tRxv//GWSTqRCzVj1TLaGivs6d9Rd73oFRY1J
 aJsPmjgMkBiPErn6sR7LC+fswx5mhH5whLtGY5EfghhIZNn9HadiscyTxJ56h00dfehY Kg== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 36yj1a428m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 04:37:05 -0500
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1219Rv8r022363
 for <alsa-devel@alsa-project.org>; Mon, 1 Mar 2021 04:37:05 -0500
Received: from ausc60ps301.us.dell.com (ausc60ps301.us.dell.com
 [143.166.148.206])
 by mx0a-00154901.pphosted.com with ESMTP id 3704m5w9g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 04:37:04 -0500
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.81,215,1610431200"; d="scan'208";a="1537356588"
From: Perry Yuan <Perry.Yuan@dell.com>
To: pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com, Mario.Limonciello@dell.com
Subject: [PATCH v4 0/2] Dell-hardware-privacy-implementation-for-dell-laptop
Date: Mon,  1 Mar 2021 17:36:13 +0800
Message-Id: <20210301093614.15888-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_02:2021-02-26,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=979 lowpriorityscore=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010078
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010078
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Perry.Yuan@dell.com, lgirdwood@gmail.com, platform-driver-x86@vger.kernel.org,
 broonie@kernel.org
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

From: Perry Yuan <perry_yuan@dell.com>

Hi All,
This patch set is a new driver for dell mobile platform ,which has the
hardware privacy feature.

For micmute led control, the hotkey is Fn + F4, it is a hardware based
mute state, and new privacy will prevent micphone void input from
hardware layer, any application cannot get voice data when micmute
activated. 

Camera mute use a new hardware design to control the camrea shutter.
When video is muted, no OS application should be functionally able to
capture images of the person/environment in front of the system

Older history:
[1]https://patchwork.kernel.org/project/platform-driver-x86/patch/20201228132855.17544-1-Perry_Yuan@Dell.com/
[2]https://patchwork.kernel.org/project/alsa-devel/patch/20201103125859.8759-1-Perry_Yuan@Dell.com/#23733605
[3]https://www.spinics.net/lists/alsa-devel/msg120537.html
[4]https://github.com/thesofproject/linux/pull/2660


Perry Yuan (2):
  platform/x86: dell-privacy: Add support for Dell hardware privacy
  ASoC: rt715:add micmute led state control supports

 .../testing/sysfs-platform-dell-privacy-wmi   |  32 ++
 drivers/platform/x86/Kconfig                  |  17 +
 drivers/platform/x86/Makefile                 |   4 +-
 drivers/platform/x86/dell-laptop.c            |  26 +-
 drivers/platform/x86/dell-privacy-acpi.c      | 164 +++++++++
 drivers/platform/x86/dell-privacy-wmi.c       | 340 ++++++++++++++++++
 drivers/platform/x86/dell-privacy-wmi.h       |  35 ++
 drivers/platform/x86/dell-wmi.c               |  29 +-
 sound/soc/codecs/rt715-sdca.c                 |  12 +
 sound/soc/codecs/rt715.c                      |  12 +
 10 files changed, 655 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
 create mode 100644 drivers/platform/x86/dell-privacy-acpi.c
 create mode 100644 drivers/platform/x86/dell-privacy-wmi.c
 create mode 100644 drivers/platform/x86/dell-privacy-wmi.h

-- 
2.25.1

