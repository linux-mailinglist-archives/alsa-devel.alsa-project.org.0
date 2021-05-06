Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FB375358
	for <lists+alsa-devel@lfdr.de>; Thu,  6 May 2021 13:57:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C78001672;
	Thu,  6 May 2021 13:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C78001672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620302256;
	bh=G6AO1/NwYT5s+C3AHysE7pTzPTco2M5mhL7731u4DWA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FFAA0iVO+33fdEwX1uEfmhNA21xG6ehEBUvFgJ/GnyqtCWuWrrcGmCKih1c/U/RgL
	 V248DuI3A2JAF2jir6jyeFXtaRC/9ZO2hk+UF7aOdHWlVtj7N1KiSLNwKADvCq2dTP
	 HiekIllXH2WTJZ5qvPLqREnpd4HPxtfgWA5OflwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33FE4F80108;
	Thu,  6 May 2021 13:56:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52CC9F8021C; Thu,  6 May 2021 13:56:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F830F8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 May 2021 13:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F830F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="u19q8H8c"
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146BqKjS017212
 for <alsa-devel@alsa-project.org>; Thu, 6 May 2021 07:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=LYonly/uyklDQji1ynBs3Ip/p70gV4rRL4QGzYkhGDk=;
 b=u19q8H8ccGLkA27Gs3DGnuRwncpiO7kGp9Fcip+XUepG3IyRsQx7EJaCOT+BKzqIgoO9
 4d6RdCCuaZPSHgh0T1i/cbMqrijkzjnCIKrrpCbpKOQB6fviM/MkJFOy2mwY7+NKK+uJ
 fHs+cy4qgAloBPoJDhM9Pe8pqvhCKujz3nGfbtv+hwgqygSupfGfPmGLdlrdmrQaM/EV
 faPBu7VIWS6W0lF00bsHp/83hpYjG3Fmoagq04ys2FubGrsv647K4SGaBodDI7FShdJL
 U8qd3rLyCylS2nV+J5bIwqbKS3O9IStsMeumc4WI5o4PHhUdJhNrV4unRLqPAwl7s1Cz xA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 38bec37194-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Thu, 06 May 2021 07:55:55 -0400
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146BocBQ011974
 for <alsa-devel@alsa-project.org>; Thu, 6 May 2021 07:55:54 -0400
Received: from esaploutpc121.us.dell.com ([143.166.85.210])
 by mx0a-00154901.pphosted.com with ESMTP id 38beahsts3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Thu, 06 May 2021 07:55:54 -0400
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.82,277,1613455200"; d="scan'208";a="10515614"
From: Perry Yuan <Perry.Yuan@dell.com>
To: pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com
Subject: [PATCH v8 0/2] hardware-privacy-implementation-for-dell-laptop
Date: Thu,  6 May 2021 19:55:29 +0800
Message-Id: <20210506115529.15572-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_08:2021-05-06,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060083
X-Proofpoint-GUID: zXr5LruLnoitsax0rsjXsgFq2Bruz_WE
X-Proofpoint-ORIG-GUID: zXr5LruLnoitsax0rsjXsgFq2Bruz_WE
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060083
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Perry.Yuan@dell.com, lgirdwood@gmail.com, platform-driver-x86@vger.kernel.org,
 broonie@kernel.org, Dell.Client.Kernel@dell.com, mario.limonciello@outlook.com
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
This patch set is a new driver for Dell mobile platform that has the
hardware privacy feature including micmute,camera mute.

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
[5]https://github.com/thesofproject/linux/issues/2496


Perry Yuan (2):
  platform/x86: dell-privacy: Add support for Dell hardware privacy
  ASoC: rt715:add micmute led state control supports

 .../testing/sysfs-platform-dell-privacy-wmi   |  55 +++
 drivers/platform/x86/dell/Kconfig             |  14 +
 drivers/platform/x86/dell/Makefile            |   1 +
 drivers/platform/x86/dell/dell-laptop.c       |  13 +-
 drivers/platform/x86/dell/dell-privacy-wmi.c  | 394 ++++++++++++++++++
 drivers/platform/x86/dell/dell-privacy-wmi.h  |  25 ++
 drivers/platform/x86/dell/dell-wmi.c          |   9 +-
 sound/soc/codecs/rt715-sdca.c                 |  42 ++
 sound/soc/codecs/rt715.c                      |  42 ++
 9 files changed, 591 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
 create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.c
 create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.h

-- 
2.25.1

