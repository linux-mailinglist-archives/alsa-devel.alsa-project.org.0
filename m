Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B97BC56DE4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 17:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 457971683;
	Wed, 26 Jun 2019 17:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 457971683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561563531;
	bh=/1OLw00uA7MWP8BAQVPUUgYm7E2YZiGuKCsFf2qAxYA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rl5QUsM7PIztfc/f2Fk60X15gsDAPUXEfK5bRszE64AbCPO9qwGsMETppPtakzYDZ
	 73gv2FPzf+O9O1mHO+4c5GhIn7Qb6TKyNM5ZqZ73IOuHUcF1SwfSb01I7HDZ4t4gtS
	 wp2ivxGmeC6OU6HXZD+7Sf0yph4S62w9LVX4ystY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A28AF89701;
	Wed, 26 Jun 2019 17:36:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 062FBF896CC; Wed, 26 Jun 2019 17:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8AFFF8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 17:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8AFFF8070C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AZVBIUfP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QFXvHu023029; Wed, 26 Jun 2019 10:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=YkPGMEnbp9ZPpVKCFAiuojkCOY39vkCxr96wQWpIFss=;
 b=AZVBIUfPkrJEJ3Fo7tfyE8Yr3k9p4acj+TR5IAqL5SBEQtM2TnuTwuAXc9sIfFKwDm22
 hd4hVgQyz/XQcLlPokgzXpLkyDCJGVPWELexDS3S52sX7RU4TovtDryUElElaE6fFTpj
 ngn5hoSdP+f4F/T6wVIg1aFMREZ5cK5VA6KxH6ImNCrZlzC8bAucFso8F4wmXhs3BLi9
 3F6x7UsjG+KagiJA1A/5ssQRw557dp/cVM/WyfdvhDz0a1tKEtHD5Q+P8RN+8HquQd9f
 abwq4m2JQCYxib1uXaJbrvWyODfOenlZqaqvefWEPj6TE+013BGazRLQ5SqzUs+ZSPap 3A== 
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
 by mx0b-001ae601.pphosted.com with ESMTP id 2tc7gt8cvy-1;
 Wed, 26 Jun 2019 10:36:13 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
 by mail4.cirrus.com (Postfix) with ESMTP id 36865611C8AF;
 Wed, 26 Jun 2019 10:36:14 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 16:36:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 26 Jun 2019 16:36:11 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D91DD45;
 Wed, 26 Jun 2019 16:36:11 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Wed, 26 Jun 2019 16:36:10 +0100
Message-ID: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260182
Cc: alsa-devel@alsa-project.org, rafael@kernel.org, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, linux-acpi@vger.kernel.org, patches@opensource.cirrus.com
Subject: [alsa-devel] [PATCH 1/2] device property: Add new array helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It is fairly common to want to read an integer array property
that is composed of an unknown number of fixed size integer
groups. For example, say each group consists of three values
which correspond to the settings for one input on the device
and the driver supports several chips with different numbers
of inputs.

Add a new helper function to provide this functionality, it
differs for the existing helpers in that it allows reading a
smaller number of values than the full array size and checks
that the number of values read is a multiple of the group size.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/base/property.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 348b37e64944c..656d21e01a648 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -133,6 +133,54 @@ int device_property_read_u32_array(struct device *dev, const char *propname,
 EXPORT_SYMBOL_GPL(device_property_read_u32_array);
 
 /**
+ * device_property_read_u32_2darray - return a 2d u32 array property of a device
+ * @dev: Device to get the property of
+ * @propname: Name of the property
+ * @val: The values are stored here or %NULL to return the number of values
+ * @nval: Size of the @val array
+ * @multiple: Number of entries in each block of data
+ *
+ * Function reads an array of u32 properties split up into fixed size
+ * sub-groups, with @propname from the device firmware description and
+ * stores them to @val if found.
+ *
+ * Return: Number of values read
+ *	   %0 if the property was not found,
+ *	   %-EINVAL if given arguments are not valid,
+ *	   %-ENODATA if the property does not have a value,
+ *	   %-EPROTO if the property is not an array of numbers,
+ *	   %-EOVERFLOW if the size of the property is not as expected.
+ *	   %-ENXIO if no suitable firmware interface is present.
+ */
+int device_property_read_u32_2darray(struct device *dev, const char *propname,
+				     u32 *val, size_t nval, int multiple)
+{
+	int n, ret;
+
+	n = device_property_read_u32_array(dev, propname, NULL, 0);
+	if (n == -EINVAL) {
+		return 0;	/* missing, ignore */
+	} else if (n < 0) {
+		dev_warn(dev, "%s malformed (%d)\n", propname, n);
+		return n;
+	} else if ((n % multiple) != 0) {
+		dev_warn(dev, "%s not a multiple of %d entries\n",
+			 propname, multiple);
+		return -EOVERFLOW;
+	}
+
+	if (n > nval)
+		n = nval;
+
+	ret = device_property_read_u32_array(dev, propname, val, n);
+	if (ret < 0)
+		return ret;
+	else
+		return n;
+}
+EXPORT_SYMBOL_GPL(device_property_read_u32_2darray);
+
+/**
  * device_property_read_u64_array - return a u64 array property of a device
  * @dev: Device to get the property of
  * @propname: Name of the property
diff --git a/include/linux/property.h b/include/linux/property.h
index e9caa290cda52..5ab0b4a7d34a2 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -40,6 +40,8 @@ int device_property_read_u16_array(struct device *dev, const char *propname,
 				   u16 *val, size_t nval);
 int device_property_read_u32_array(struct device *dev, const char *propname,
 				   u32 *val, size_t nval);
+int device_property_read_u32_2darray(struct device *dev, const char *propname,
+				     u32 *val, size_t nval, int multiple);
 int device_property_read_u64_array(struct device *dev, const char *propname,
 				   u64 *val, size_t nval);
 int device_property_read_string_array(struct device *dev, const char *propname,
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
