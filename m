Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3316E35BFB5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 11:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31841654;
	Mon, 12 Apr 2021 11:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31841654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618219171;
	bh=90xckAj0a/cPgxaH4o1j/jtEbgSTNRxEDc6nCU1cGwI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M2hAAtRk8VPnxKg3x727h3duNM9qfJE36CmRlMuo1k0xmE2Z95HVpbg0kZLmF4jm8
	 Kk913zgW+i7SbAH/uQoD4S6DHBUuhfTW+6gHKoaNpYnkmAP0eHbwpUy3wbBmjuRIiy
	 +MYGgW+sjinGO34tFQMSn0fc7Oa2DEF2Hqi7O84Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ED00F800FF;
	Mon, 12 Apr 2021 11:18:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5CE8F8013D; Mon, 12 Apr 2021 11:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A986BF8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 11:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A986BF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="u9JI5Ydy"
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13C9CATE010649
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 05:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=KFIFE8UJy90Y2MVElNIAftsv7/F8+aOXBzc+KxnEAe0=;
 b=u9JI5YdyNvu3aWdTbk+UkbK6GmZsK6qBTiZXhU0X1CyaG7tFM5HQRyFKEEuRw34yDSbp
 IhdpYtzNxwd41sUIYMTRzgcEUvb2zAqkGphb1jIUzXwC0ZmugoAQGiL64VXqvwldunqp
 vgRIKpGnKdurXRsVB9qAksWAu0To6CLhMaBpB1gIe82qLP9q3qzECZzHBgekz0c297N7
 kK7wd9B3MrTId2wAk/Pqcp0EW4OoiQirK/Tt+NQrWKStme60Rch5uaLnZh0Par/TBSSZ
 uiv/5iOc2hE17HjllVe9lrlYVEVhjH/eLqPdM6JM9QOGArml5Fm+z/xhqRfBMTWHvund TQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 37u81mvn09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 05:17:41 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13C9AMLh010534
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 05:17:40 -0400
Received: from ausxippc110.us.dell.com (AUSXIPPC110.us.dell.com
 [143.166.85.200])
 by mx0b-00154901.pphosted.com with ESMTP id 37us8fd4v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 05:17:40 -0400
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.81,216,1610431200"; d="scan'208";a="1076903885"
From: Perry Yuan <Perry.Yuan@dell.com>
To: pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com
Subject: [PATCH v7 0/2] hardware-privacy-implementation-for-dell-laptop
Date: Mon, 12 Apr 2021 17:17:23 +0800
Message-Id: <20210412091725.7820-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_07:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120061
X-Proofpoint-GUID: twhGyyBxnwZzakOHkw3pBuAx3WdYC5jv
X-Proofpoint-ORIG-GUID: twhGyyBxnwZzakOHkw3pBuAx3WdYC5jv
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120061
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
 drivers/platform/x86/dell/dell-laptop.c       |  23 +-
 drivers/platform/x86/dell/dell-privacy-wmi.c  | 394 ++++++++++++++++++
 drivers/platform/x86/dell/dell-privacy-wmi.h  |  23 +
 drivers/platform/x86/dell/dell-wmi.c          |   8 +-
 sound/soc/codecs/rt715-sdca.c                 |  42 ++
 sound/soc/codecs/rt715.c                      |  43 ++
 9 files changed, 596 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
 create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.c
 create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.h

-- 
2.25.1

