Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D24CC1F1
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 16:51:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59A8318FF;
	Thu,  3 Mar 2022 16:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59A8318FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646322715;
	bh=0hsZkuYLerD7yph11E09TWtsff0gVsYJiMBgCBLN4Bo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A7lIZyvwbmbppQL3PHyQlYBBZh2NhJYx1AYguvtj90Qkkx9IUPoqAUTOZgtpWhduv
	 Cw8UTqnneu94A3Os57J4MshMam/mcUmYRfTyWwvK8HY2AihMHr8RgsBfDmTAfqzwKv
	 ftpHZ6l7Xok2cm879UIqmnMaQS54dDqTBHdI17rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFCACF80109;
	Thu,  3 Mar 2022 16:50:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B93EF8013D; Thu,  3 Mar 2022 16:50:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23EA1F8013D
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 16:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23EA1F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lqXLsyqR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2235lqur030833;
 Thu, 3 Mar 2022 09:50:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=AG0n2ijCgNT2DbNgl3H2xjT8rhgbgXbGPEN/ZYtBqco=;
 b=lqXLsyqRWdUiwJ6Mdlf7lU/J3mvF90N4A+D7VLu+E+ji2A+Vz3h/QtaClpx47fuL2egt
 qCDQlCI+mv2qaD6I+jQPkeBNlu7yWvn0vIHiP1S3MWQHjYzsJKH9LrbGVYzaq7k2TNYo
 DoSCbeR5aY9FRp8DIQO3WQ2OQtSMLJyXGvlaPgZyAvwF/l8LpWGm1NWCuzlfRC0ZiJms
 fSnJvpOzv3LIpDcnDBjNW2K5m7tLQksoQcn/ovc6nlkcGn14xyiBHKrrzwqFkPuYAkHE
 8JImXFN+9yT7VHsN08ihK9Abp8hMVk23o2j7cS/nW+D7bUjuHrfFAtkmrKMZtumEX3+Q 9A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8tkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 09:50:31 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 15:50:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 15:50:29 +0000
Received: from simont-vb.lan?044ad.cirrus.com (LONN13613Z2.ad.cirrus.com
 [198.61.64.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 913537C;
 Thu,  3 Mar 2022 15:50:29 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Expand firmware loading search options
Date: Thu, 3 Mar 2022 15:50:16 +0000
Message-ID: <20220303155016.122125-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wPaagACGvGse1HA0xYdRgPLNwX3odZaY
X-Proofpoint-GUID: wPaagACGvGse1HA0xYdRgPLNwX3odZaY
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The parts supported by this driver can have product-specific
firmware and tunings files. Typically these have been used on
embedded systems where the manufacturer is responsible for
installing the correct product-specific firmware files into
/lib/firmware. However, the linux-firmware repository places all
available firmwares into /lib/firmware and it is up to the driver to
select the correct product-specific firmware from that directory.

For example a product containing four smart amplifiers may provide
firmware specific for that product and each of the amplifiers may
have coefficient files containing tunings for their placement in the
mechanical design.

This change extends firmware (wmfw) and coefficient (bin) filenames
to be of the general form:

<cirrus/>part-dspN-fwtype<-system_name<-asoc_component_prefix>>.type

Where the cirrus subdirectory, system_name and asoc_component_prefix
are optional.

New files will be placed in the cirrus subdirectory to avoid
polluting the main /lib/firmware/ location. The generic name must be
searched in /lib/firmware before /lib/firmware/cirrus so that a
generic file in the new location does not override existing
product-specific files in the legacy location.

The search order for firmware files is:
  - cirrus/part-dspN-fwtype-system_name-asoc_component_prefix.wmfw
  - cirrus/part-dspN-fwtype-system_name.wmfw
  - part-dspN-fwtype.wmfw
  - cirrus/part-dspN-fwtype.wmfw

- Qualifications are added to the filename so that rightwards is more
  specific.
- The system_name is provided by the codec driver.
- The asoc_component_prefix is used to identify tunings for individual
  parts because it would already exist to disambiguate the controls
  and it makes it obvious which firmware file applies to which device.

The optional coefficient file must have the same filename
construction as the discovered wmfw except:
  - where the wmfw has only system_name then the bin file can
    optionally include the asoc_component_prefix. This is to allow a
    common wmfw for all amps but separate tunings per amp.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 99 +++++++++++++++++++++++++++++++++-----
 sound/soc/codecs/wm_adsp.h |  1 +
 2 files changed, 88 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 0582585236a2..5ba88c5272d0 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -744,21 +744,48 @@ static void wm_adsp_release_firmware_files(struct wm_adsp *dsp,
 }
 
 static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
-					 const struct firmware **firmware,
-					 char **filename,
-					 char *suffix)
+					 const struct firmware **firmware, char **filename,
+					 const char *dir, const char *system_name,
+					 const char *asoc_component_prefix,
+					 const char *filetype)
 {
 	struct cs_dsp *cs_dsp = &dsp->cs_dsp;
+	char *s, c;
 	int ret = 0;
 
-	*filename = kasprintf(GFP_KERNEL, "%s-%s-%s.%s", dsp->part, dsp->fwf_name,
-			      wm_adsp_fw[dsp->fw].file, suffix);
+	if (system_name && asoc_component_prefix)
+		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-%s.%s", dir, dsp->part,
+				      dsp->fwf_name, wm_adsp_fw[dsp->fw].file, system_name,
+				      asoc_component_prefix, filetype);
+	else if (system_name)
+		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s.%s", dir, dsp->part,
+				      dsp->fwf_name, wm_adsp_fw[dsp->fw].file, system_name,
+				      filetype);
+	else
+		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s.%s", dir, dsp->part, dsp->fwf_name,
+				      wm_adsp_fw[dsp->fw].file, filetype);
+
 	if (*filename == NULL)
 		return -ENOMEM;
 
-	ret = request_firmware(firmware, *filename, cs_dsp->dev);
+	/*
+	 * Make sure that filename is lower-case and any non alpha-numeric
+	 * characters except full stop and forward slash are replaced with
+	 * hyphens.
+	 */
+	s = *filename;
+	while (*s) {
+		c = *s;
+		if (isalnum(c))
+			*s = tolower(c);
+		else if ((c != '.') && (c != '/'))
+			*s = '-';
+		s++;
+	}
+
+	ret = firmware_request_nowarn(firmware, *filename, cs_dsp->dev);
 	if (ret != 0) {
-		adsp_err(dsp, "Failed to request '%s'\n", *filename);
+		adsp_dbg(dsp, "Failed to request '%s'\n", *filename);
 		kfree(*filename);
 		*filename = NULL;
 	}
@@ -766,21 +793,69 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 	return ret;
 }
 
+static const char *cirrus_dir = "cirrus/";
 static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 					  const struct firmware **wmfw_firmware,
 					  char **wmfw_filename,
 					  const struct firmware **coeff_firmware,
 					  char **coeff_filename)
 {
+	const char *system_name = dsp->system_name;
+	const char *asoc_component_prefix = dsp->component->name_prefix;
 	int ret = 0;
 
-	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename, "wmfw");
-	if (ret != 0)
-		return ret;
+	if (system_name && asoc_component_prefix) {
+		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+						   cirrus_dir, system_name,
+						   asoc_component_prefix, "wmfw")) {
+			adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
+			wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+						      cirrus_dir, system_name,
+						      asoc_component_prefix, "bin");
+			return 0;
+		}
+	}
 
-	wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename, "bin");
+	if (system_name) {
+		if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+						   cirrus_dir, system_name,
+						   NULL, "wmfw")) {
+			adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
+			if (asoc_component_prefix)
+				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+							      cirrus_dir, system_name,
+							      asoc_component_prefix, "bin");
+
+			if (!*coeff_firmware)
+				wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+							      cirrus_dir, system_name,
+							      NULL, "bin");
+			return 0;
+		}
+	}
 
-	return 0;
+	if (!wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+					   "", NULL, NULL, "wmfw")) {
+		adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
+		wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+					      "", NULL, NULL, "bin");
+		return 0;
+	}
+
+	ret = wm_adsp_request_firmware_file(dsp, wmfw_firmware, wmfw_filename,
+					    cirrus_dir, NULL, NULL, "wmfw");
+	if (!ret) {
+		adsp_dbg(dsp, "Found '%s'\n", *wmfw_filename);
+		wm_adsp_request_firmware_file(dsp, coeff_firmware, coeff_filename,
+					      cirrus_dir, NULL, NULL, "bin");
+		return 0;
+	}
+
+	adsp_err(dsp, "Failed to request firmware <%s>%s-%s-%s<-%s<%s>>.wmfw\n",
+		 cirrus_dir, dsp->part, dsp->fwf_name, wm_adsp_fw[dsp->fw].file,
+		 system_name, asoc_component_prefix);
+
+	return -ENOENT;
 }
 
 static int wm_adsp_common_init(struct wm_adsp *dsp)
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 7f4fabbc6ad3..375009a65828 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -28,6 +28,7 @@ struct wm_adsp {
 	struct cs_dsp cs_dsp;
 	const char *part;
 	const char *fwf_name;
+	const char *system_name;
 	struct snd_soc_component *component;
 
 	unsigned int sys_config_size;
-- 
2.34.1

