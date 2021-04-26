Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1736B701
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 18:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D996716C6;
	Mon, 26 Apr 2021 18:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D996716C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619455178;
	bh=f4gR8UptoD+fcfBXNmAQ6g3lFliZzEmfb9PTcIfL94k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NRsfnBNBIRPuFrEj+Grd5l04TvEZaRE38rcE3Pa6/upbp6PXskF6wIGH5RuWiYJ2F
	 1Y+daXaKeiTLgwyUD3/+vBPz3/je95w89jro83UPK5HrZOITukt0NwLbJJEE/vn7LX
	 1rowKd2SktrrB2ereOlbYqq+/RZ7hK5M8TWsVo1o=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17EBEF8012A;
	Mon, 26 Apr 2021 18:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDF33F80218; Mon, 26 Apr 2021 18:38:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 651C0F8012A
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 18:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 651C0F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fDIWsjCl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QGbpT6021529; Mon, 26 Apr 2021 11:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=eqJUMbnkhTrwDLjuT64AjqedgEqwqlStWMiEMC13D7U=;
 b=fDIWsjClttMG+6rv/+e7Kz7CdqWlY/8kWmedbcqXAJnFvaLQWVuafJJtBCiUA9YT9ugf
 WZSKGPvnPJdWODonXyVMg5ba2etb5FANP+zd973FnH1VKprDm8ZyqwQAXaSs1YyHK3+m
 n/jbEJouGB1dBJDxKYuYycUKdw1HYibwuSkxSfob6Oxyoa9rFmpHiPdWZg8Am70Qlpv3
 lnzsAfpDQmGTEkMXrslAA3Xqs1jnVTLC/XNmvawAeZyU6xBr4DtAao1Ub3yoj4LBZPqV
 DHMyDplyaeLi+QmVepcOxaOpATQjVEKFGVVGpfEyEAdUrY911NVW4tDZ3VbMzpkvRcu1 TA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 385wdbrayb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Apr 2021 11:37:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 17:37:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Apr 2021 17:37:49 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.203])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B219411D1;
 Mon, 26 Apr 2021 16:37:49 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/2]  Fix couple of bugs reported by Canonical
Date: Mon, 26 Apr 2021 17:37:47 +0100
Message-ID: <20210426163749.196153-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: u_eH0bjPAC3fqQA8uy1G7KrSZYbLPP6u
X-Proofpoint-GUID: u_eH0bjPAC3fqQA8uy1G7KrSZYbLPP6u
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=911
 clxscore=1015 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260127
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

In v2:
- Add additional information in commit messages.

Stefan Binding (2):
  ALSA: hda/cirrus: Set Initial DMIC volume for Bullseye to -26 dB
  ALSA: hda/cirrus: Use CS8409 filter to fix abnormal sounds on Bullseye

 sound/pci/hda/patch_cirrus.c | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

-- 
2.25.1

