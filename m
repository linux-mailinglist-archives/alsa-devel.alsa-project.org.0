Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DC9FE5EB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 20:47:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE6B1668;
	Fri, 15 Nov 2019 20:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE6B1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573847236;
	bh=Ztayu/m++ki2wlx6tR0BqfcjcFyMWl0pPLhzK07OGQo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oDgUMdpjmfSAFQjxveEOLU/kW1zL6FVMuRqXUs12Tg/GoeQDCXHZExS51dSLhZptj
	 2kVEIdxhzQVwVXwAEiiq70wecQHTKHVvg3M+iSoAHzjMJSrGZoEAg5QYXOdVLJTbLB
	 kqWuvCUTKx+3aIH8Tk3Z1/i9UMQZeP6RL8OwgQMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78786F80104;
	Fri, 15 Nov 2019 20:45:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2742F80104; Fri, 15 Nov 2019 20:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 174C7F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 20:45:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 174C7F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CDYN+qJG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFJii7B016440; Fri, 15 Nov 2019 13:45:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=PODMain02222019;
 bh=A+V6ipY9EvXHIwr95T84hyFv9S169W5ThcoXMv3tVt4=;
 b=CDYN+qJGmHyEjWGqtGvNIrD3PJZiK+2tQk5bAuNRdOrNRvdts+2PbOgdh23ZjoPXr/Qv
 7iOWnsQfdxVNDN2Isv0A21O7L+ENsFu/cO8/BPw1dFqS5YQs2c21fCTmbYdo9DoCVVgN
 2FPAGcB5ipDFaZv8ry5irKTwkERN34SLGiQ/3N8PM0a4Fbb5+/b1VTX+3OLW6+8ZjMkq
 IYU3bFJ/kEiGkLYLXV629wLVv67fzJ1RbZSTzU9ORjM4S30LBnz+Ts/0iX/Fpc1dzqph
 7INVYdAvgUyRjk1353cd0W5RKTaH0j7exoDIiMJc5vzaDUa/4Hvn4IUVkiTLsSp0WGI8 7A== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=David.Rhodes@cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2w5trp2ac6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Nov 2019 13:45:22 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 15 Nov
 2019 19:45:20 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 15 Nov 2019 19:45:20 +0000
Received: from david-linux.ad.cirrus.com (david-linux.ad.cirrus.com
 [141.131.206.99])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 92A192D4;
 Fri, 15 Nov 2019 19:45:18 +0000 (UTC)
From: David Rhodes <david.rhodes@cirrus.com>
To: <ckeepax@opensource.cirrus.com>, <david.rhodes@cirrus.com>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Date: Fri, 15 Nov 2019 13:54:12 -0600
Message-ID: <1573847653-17094-1-git-send-email-david.rhodes@cirrus.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:107.20.210.250 ip4:52.1.14.157 ip4:141.131.128.20 ip4:141.131.3.20
 ip4:213.128.236.230 ip4:87.246.98.25 ip4:87.246.78.26 ip4:87.246.76.56
 ip4:87.246.98.35 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 mlxlogscore=492 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911150174
Subject: [alsa-devel] [PATCH v2] ASoC: wm_adsp: Expose mixer control API
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


Changes since v1:
  Updated commit message
  Handle controls without subname
  Call snd_ctl_notify() in wm_adsp_write_ctl()
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
