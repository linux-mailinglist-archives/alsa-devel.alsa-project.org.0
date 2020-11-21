Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE662BC075
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Nov 2020 17:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06A9116BB;
	Sat, 21 Nov 2020 17:16:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06A9116BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605975415;
	bh=D4qf72r0CU9smDPiVfQRj0FwdKF6Z/m1Ehh+njYLvZ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=taTb2B4ql/KBdJAgzeoBJYtcQiTs6cpplgNMP9/AJL2RP4K5I3jQiTvWghfG496hb
	 dxoqnnYi5g92m3P4qKypnXtxG6YPQlTVL/kN3/4UsqAnhzMlqjih/D6+TKzolVPGUi
	 KelQkPl61x2BAMfZ3JDaUfSV89Q+QYSRN6WrkCSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA34F80166;
	Sat, 21 Nov 2020 17:15:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE204F801F9; Sat, 21 Nov 2020 17:15:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29847F80166
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 17:15:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29847F80166
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ALGAEC5010928; Sat, 21 Nov 2020 11:15:10 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 34y08urk57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Nov 2020 11:15:10 -0500
Received: from SCSQMBX11.ad.analog.com (SCSQMBX11.ad.analog.com [10.77.17.10])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 0ALGF8IO012648
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
 verify=FAIL); Sat, 21 Nov 2020 11:15:08 -0500
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX11.ad.analog.com (10.77.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Sat, 21 Nov 2020 08:15:06 -0800
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Sat, 21 Nov 2020 08:15:06 -0800
Received: from NSA-L01.ad.analog.com ([10.32.226.88])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0ALGF2x3028455;
 Sat, 21 Nov 2020 11:15:03 -0500
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/2] Make cb a required parameter of buffer-cb
Date: Sat, 21 Nov 2020 17:14:55 +0100
Message-ID: <20201121161457.957-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-21_04:2020-11-20,
 2020-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=763
 clxscore=1011 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011210111
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Jonathan Cameron <jic23@kernel.org>
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

When going through the code of the buffer-cb interface and all it's
users, I realized that the stm32_adfsdm driver is calling
`iio_channel_get_all_cb()` with NULL for the cb. After going a bit
trough the stm drivers, it looks like this is actually intentional.
However, it is clear that we have a clear/direct route here for a NULL
pointer dereference. This change makes cb a required parameter of the
API.

The first patch makes the necessary changes to the stm32_adfsdm driver
so that it does not break.

Nuno Sá (1):
  iio: buffer: Return error if no callback is given

Olivier Moysan (1):
  ASoC: stm32: dfsdm: add stm32_adfsdm_dummy_cb() callback

 drivers/iio/buffer/industrialio-buffer-cb.c |  5 +++++
 sound/soc/stm/stm32_adfsdm.c                | 12 +++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.17.1

