Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B6F36A19E
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Apr 2021 16:35:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26EAC1757;
	Sat, 24 Apr 2021 16:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26EAC1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619274922;
	bh=A3VKk7oy7rmu1qdeB52kSvOdOONCKCzli7WZwTA+Cd0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bkLoRrh4bXSb+WO/Dww9CGu3tiF4+YvWxEUPyXhUJnC+F0rRD3/RG8qgRNRlbwENg
	 hCKjW1j/DVvVPYN1rnXYxEMg9bpuCZXHpMw5HrCbbMdw+0GjOksM43OVbqqKLUk8Qq
	 MfaS6Up1Vbm4Lpc6neucn4ojrBAJGEzQhzEw6gVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A70DF8032D;
	Sat, 24 Apr 2021 16:33:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE669F80253; Sat, 24 Apr 2021 16:33:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B881AF800AA
 for <alsa-devel@alsa-project.org>; Sat, 24 Apr 2021 16:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B881AF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OmqLGAWx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13OERRe5030110; Sat, 24 Apr 2021 09:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=y9JGCthEI6eOsolpJE66FNolo0/WjCj1PhSLiW2R02c=;
 b=OmqLGAWxAoOGO/KC3MHV1Cjx1EJhTUmmuOaijPxyIzlLv+87MSvYSUhNK2oMVn83Krpp
 kcslg8ZaRihGvru5GYduK4bpouDngwZIcu6ltyulNYBW4WUS9XPk3Ayow2hsXLBVjuoU
 LyyltHiFDepyIZBtlxx1EOpAiQyrcK1gdY7m70ii89MerjknlCv2o+c+C6aUqXLv+F3A
 1eS0d0Q9m+gKE0HUKT7gN769mTNTI3jGk2BjC8nyM82wmfTlsIs2SXBtt/xObAT/Fur9
 WaWvlgyP4UKhGDwaByDBoKD5diBOct4LPAKu047KGos8nnI7SOqaMjQ3BwoQqNjdZwHS pA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 384frs094u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 24 Apr 2021 09:32:46 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 24 Apr
 2021 15:32:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Sat, 24 Apr 2021 15:32:44 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.200])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6CB2E11CB;
 Sat, 24 Apr 2021 14:32:44 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 0/2] Fix couple of bugs reported by Canonical
Date: Sat, 24 Apr 2021 15:32:42 +0100
Message-ID: <20210424143244.639125-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UtVqZk6ls8Qs_KNVinoOBqeoUbazUQFj
X-Proofpoint-GUID: UtVqZk6ls8Qs_KNVinoOBqeoUbazUQFj
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=825 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104240107
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

CirrusLogic: Cracking noises appears in built-in speaker when output 
volume is set >80%
BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1923557i

CirrusLogic: The default input volume is "0%" 
BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1924997

Stefan Binding (2):
  ALSA: hda/cirrus: Set Initial DMIC volume for Bullseye to 16%
  ALSA: hda/cirrus: Use CS8409 Equalizer to fix abnormal sounds on
    Bullseye

 sound/pci/hda/patch_cirrus.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

-- 
2.25.1

