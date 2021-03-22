Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38FF343D02
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 10:39:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AEE042;
	Mon, 22 Mar 2021 10:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AEE042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616405992;
	bh=9Oz6ELxaURahulTfFK14Z0cGw7B+B7m2VibQbD5jris=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nsHkeaLCaIDGzvZUCLJNO7aqYKY8bKO/ZL/opIDcJaOVei3k5WgLtqpEZj6U7D5/V
	 I5hpq8U7XZDLz1lNt/xSpvefVlGY11EAvZDnNs++wioIiIiDvBvAXDRvQksnmiLZWL
	 e+U8glT/6kJndKes0JS59jFsjMrDztVrAAPkHu7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9731F80107;
	Mon, 22 Mar 2021 10:38:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2397F8016B; Mon, 22 Mar 2021 10:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26196F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 10:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26196F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="lMO1Tv85"
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12M9GrA4026296
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=NAC2lMtRM8NWthEFOAc3VP8TaqtZBRju9fMmGpRg3d0=;
 b=lMO1Tv85AcAtrc0I43HtnJx3Bn62CYaqv9u4AbenAyXuUNjjDY/jMmI4lNZwfOLUs0T4
 jUHvHzoy/bWXY2phd+ILWMD1Da66GTdWeaFcfjFl7iDOeeNvmA4jGTfyx5zy630JW2DW
 2pa+xcfHDgTwNKUZyopI02obXFGiOeeBPl2Sb19vqWTINKDYnF+HSe1taoFFnwXSTCj9
 +Di0IXXJkbjmYTbEZWivOrLKVWIItZMSbVYTpz1dWWvFHRg1GWvGY4CT41T2D+4ChNYg
 f2fdXOsMAP8yiJnY7Brv3NLkr4KwOHaYxjOTlwmn+tuQPamoVWvwDa0tzvSx9jy7fIZy LQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 37dggkbk41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:38:10 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12M9GF5t154319
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:38:09 -0400
Received: from ausxipps306.us.dell.com (AUSXIPPS306.us.dell.com
 [143.166.148.156])
 by mx0b-00154901.pphosted.com with ESMTP id 37dx9ev148-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:38:09 -0400
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.75,453,1589259600"; d="scan'208";a="580340369"
From: Perry Yuan <Perry.Yuan@dell.com>
To: pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com, Mario.Limonciello@dell.com
Subject: [PATCH v5 0/2] hardware-privacy-implementation-for-dell-laptop
Date: Mon, 22 Mar 2021 17:37:42 +0800
Message-Id: <20210322093743.13452-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_03:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220072
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220072
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

 .../testing/sysfs-platform-dell-privacy-wmi   |  32 ++
 drivers/platform/x86/dell/Kconfig             |  16 +
 drivers/platform/x86/dell/Makefile            |   3 +
 drivers/platform/x86/dell/dell-laptop.c       |  23 +-
 drivers/platform/x86/dell/dell-privacy-acpi.c | 164 +++++++++
 drivers/platform/x86/dell/dell-privacy-wmi.c  | 340 ++++++++++++++++++
 drivers/platform/x86/dell/dell-privacy-wmi.h  |  35 ++
 drivers/platform/x86/dell/dell-wmi.c          |  27 +-
 sound/soc/codecs/rt715-sdca.c                 |  11 +
 sound/soc/codecs/rt715.c                      |  12 +
 10 files changed, 650 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
 create mode 100644 drivers/platform/x86/dell/dell-privacy-acpi.c
 create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.c
 create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.h

-- 
2.25.1

