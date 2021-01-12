Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4912F36E2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 18:19:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107F51720;
	Tue, 12 Jan 2021 18:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107F51720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610471972;
	bh=t2vZIhY2Sa3u7VwxbWI8RoLdT8OGtPph5MinwYJozts=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DU55a+eUdO7MIruw0eYaVvMjgGaGUmsV+Co9kZDb6owUHHLJ+JVGGd0L+O/kjSvAF
	 duHUKEGyjT0uacO6PfqdVRkiOdcCf/G1uQUlMh/5M1TecF29imxDR+/6jtd7KcR8f9
	 ZJOk2EpQyz7cWLx+DUGRxSabKkGGofyN7AJD9p18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A1C3F804CB;
	Tue, 12 Jan 2021 18:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BFCBF804CA; Tue, 12 Jan 2021 18:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA950F804C2
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 18:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA950F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="KoSenVRw"
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CHGkD4020931
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 12:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=smtpout1;
 bh=L7UDV4OsvGqkzA5vLc0HkD7xw4W2hmJh4Fwl6TgQr/0=;
 b=KoSenVRwXLHIhJzw/dUcShqQuGNDu8HcXlWsIl25YJhVf/t4yAO1dgC7nAGXZm+iYmt9
 ZE5gRDPQiWNzSfHN97CMg1NwIyKfov/VbBvB1GyulqXSQCSX6RVri1As3q6m7WjCV7Gc
 /FrX9Rvv9z3z67rI+RvbhPblNOcLGHuh0+NStS/8kPnEBbEHABRpGwLjM3LYCJKm5BRU
 DVrSJTG0+mVFRlUMpcG5NrnuHnRF6YpxPexkFR+b2lLbI+D6g78V/2ZRWOO6uUDtx7zC
 wMTs6fWV4Be5fghKXI3LTQE3sEUQs1CSmuw6ObyY5YvwPcTBunCWN6pwkTxzOb72MaGB 5A== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 361fy180vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 12:18:04 -0500
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CHGUtM122173
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 12:18:03 -0500
Received: from ausc60pc101.us.dell.com (ausc60pc101.us.dell.com
 [143.166.85.206])
 by mx0b-00154901.pphosted.com with ESMTP id 361fr6g95p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 12:18:03 -0500
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.79,341,1602565200"; d="scan'208";a="1653628522"
From: Perry Yuan <Perry.Yuan@dell.com>
To: oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 hdegoede@redhat.com, mgross@linux.intel.com
Subject: [PATCH v3 2/3] x86/platform/dell-privacy-wmi: add document for dell
 privacy driver
Date: Wed, 13 Jan 2021 01:17:55 +0800
Message-Id: <20210112171755.14408-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_12:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120100
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120101
Cc: alsa-devel@alsa-project.org, Mario.Limonciello@dell.com,
 linux-kernel@vger.kernel.org, Perry.Yuan@dell.com, lgirdwood@gmail.com,
 platform-driver-x86@vger.kernel.org, broonie@kernel.org
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

Describe the Dell Privacy feature capabilities and devices
state class exposed by BIOS

Signed-off-by: Perry Yuan <perry_yuan@dell.com>
---
 .../testing/sysfs-platform-dell-privacy-wmi   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
new file mode 100644
index 000000000000..3dbc2d25b60e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
@@ -0,0 +1,31 @@
+What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/devices_supported
+Date:		Jan 2021
+KernelVersion:	5.11
+Contact:	"perry_yuan@dell.com>"
+Description:
+		Display which dell hardware level privacy devices are supported
+		“Dell Privacy” is a set of HW, FW, and SW features to enhance
+		Dell’s commitment to platform privacy for MIC, Camera, and
+		ePrivacy screens.
+		The supported privacy haredware privacy devices are:
+		 * 0x0 - None,
+		 * 0x1 - Microphone,
+		 * 0x2 - Camera,
+		 * 0x4 - ePrivacy Screen
+
+What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/current_state
+Date:		Jan 2021
+KernelVersion:	5.11
+Contact:	"perry_yuan@dell.com>"
+Description:
+		Allow user space to check current dell privacy device state.
+		Describes the Device State class exposed by BIOS which can be
+		consumed by various applications interested in knowing the Privacy
+		feature capabilities
+		There are three Bits for available states:
+		    * 0 -> Off
+		    * 1 -> On
+		    * Bit0 -> Microphone
+		    * Bit1 -> Camera
+		    * Bit2 -> ePrivacyScreen
+
-- 
2.25.1

