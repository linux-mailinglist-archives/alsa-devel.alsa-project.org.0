Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF8216957
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 11:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50181678;
	Tue,  7 Jul 2020 11:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50181678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594114990;
	bh=2WUs+8pu4e2Y+N0gdUIwpKdrxMn+ky8J2I67yMLT2OI=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eEsf4WhcS/1TQW//lbXlLVTC0sexfWqdo1l5B0BgD9m487VWvCrpbdkJvF+u722V+
	 zPuR2SYKOfaxt4N6xC7yrKzg+qaRrLL12Jl61Mk/Gnogs5EYZedNnzEkDZqxV6IjnJ
	 WXZI0ICIzEZZFWsvsBMxWb8VYoKXps7qXvaEGtMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75688F801F9;
	Tue,  7 Jul 2020 11:41:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34673F8022D; Sun,  5 Jul 2020 01:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 MIME_QP_LONG_LINE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from ms11p00im-qufo17281501.me.com (ms11p00im-qufo17281501.me.com
 [17.58.38.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 534DAF8011B
 for <alsa-devel@alsa-project.org>; Sun,  5 Jul 2020 01:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 534DAF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com
 header.b="jgusVyxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1593906031;
 bh=KneMI2MOPfKCJsFHh9TqlnPbKIi4f2eeJHd/o92j96Q=;
 h=To:From:Subject:Date:Message-id:Content-Type;
 b=jgusVyxyKmuJCsa3kZzOc3Gp5f4KrizJFNanPE4Koh/EWiOM2cj4WrS+9+hnMX2Dh
 dOfB0nuB3HyZ7E0AuFf/nl1Rv3x2lC9oHWpCtq61x2o7ny1GPaes4+23xmJTL1kifC
 PnGMT/lNes1FcGr5zrgu6WHgxIFUHORg59RyT8X36pKJIo5SJCJ2Qofu7QWST6iVOj
 KUf+klUphQHHkWjC23NvzQmC6caXJ0yLdDHr/HFZTtAZNS1lz7MFEeg6wKNU7+2OwL
 EWTWbQvC2hclAV6GhuLBhrvc8fn0F/8mNwX1nTix8OkGzhAOXHd5A7f3xktGPLqS5I
 VbK8bKZA/flhQ==
Received: from ms11p00im-qufo17281501.me.com (ms11p00im-qufo17281501.me.com
 [17.58.38.52])
 by ms11p00im-qufo17281501.me.com (Postfix) with ESMTPS id 0C343B401A5
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 23:40:31 +0000 (UTC)
Received: from localhost (ms11p00im-qufv10072901.me.com [10.9.18.26])
 by ms11p00im-qufo17281501.me.com (Postfix) with ESMTP id 037E6B4019B
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 23:40:31 +0000 (UTC)
To: alsa-devel@alsa-project.org
From: Jefferson Smith Pizarro Gutierrez <jpi59@icloud.com>
Subject: Asus Xonar SE
Date: Sat, 04 Jul 2020 23:40:30 -0000
X-Mailer: iCloud MailClient2010Project52
 MailServer2011B332.10000-Famine2011-0-e73dd42b508f
Message-id: <ef670267-4d54-444d-9422-d52008b2824d@me.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-04_17:2020-07-02,
 2020-07-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=397 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2004280000 definitions=main-2007040171
X-Mailman-Approved-At: Tue, 07 Jul 2020 11:41:50 +0200
Content-Type: text/plain;
    charset=utf-8;
    format=flowed
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

hi, i have issues with my Asus Xonar SE souncard,=C2=A0 i need to get a so=
lution, please helpme to get sound through=C2=A0 the spdif of the soundcar=
d. i dont have sound
