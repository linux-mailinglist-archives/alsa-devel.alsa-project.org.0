Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD6216958
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 11:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B17351672;
	Tue,  7 Jul 2020 11:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B17351672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594115014;
	bh=YQR+8bcJb6NOX0CQW2V4rB7TnezNIQi9UVtjfgjO2DY=;
	h=To:From:Subject:Date:References:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mNCkI0uhn5STWlMTgap2kl6JNb4qTsxhhMTAxp//EZToaYoqBvn7s3DRhMxy8QgCG
	 nEvS+BLXdTFnCsOMSIFe0XDs3XbgtSL9rB7XAZ6v29fjAfJC8Slhc5Vb3EV6p5NuK9
	 M7JMeFs6XWeIKkXPoMTozkE2padvrPvwtBMvRDB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9232DF802A9;
	Tue,  7 Jul 2020 11:41:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E428BF8022D; Sun,  5 Jul 2020 01:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 MIME_QP_LONG_LINE, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ms11p00im-qufo17291301.me.com (ms11p00im-qufo17291301.me.com
 [17.58.38.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ECCCF800E2
 for <alsa-devel@alsa-project.org>; Sun,  5 Jul 2020 01:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ECCCF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com
 header.b="HAMNaPGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1593906098;
 bh=x2OsnTg4Rp1jmgu5tPUYagV10QVa7U70AfCriv57tnY=;
 h=To:From:Subject:Date:Message-id:Content-Type;
 b=HAMNaPGUASK2J0y4XHFSfDJcprMBlVa4ycdHHImHRjSjEK1AzIKn61PTn51lKHK5Y
 uk4oXuSbxS11UgXqeIUJsfcmHOEnsb8EvfieageQw8+ZNw8TG8KBXES3acdH/RNWKP
 F3T5INv2ecAgPktzqzANjjXNprXXreCXlenf3Zqg5ZsigzrL2WiKCxLDZbES3cdYn1
 3DdgRfHixVqRLD3HsdYr7e+bjKyJ5pR5UNuL4SMc/mU12MglAT0I0Cc/KADPQdP4n5
 R3p9DwKOoVH1xopgofWBm+DreVhXO47BTrLz13oLBSX2MSCAji3puAxH2BkfTvR61O
 /g8EfHOJe6AFw==
Received: from ms11p00im-qufo17291301.me.com (ms11p00im-asmtpout1.me.com
 [10.112.110.142])
 by ms11p00im-qufo17291301.me.com (Postfix) with ESMTPS id 9C40610026B
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 23:41:38 +0000 (UTC)
Received: from localhost (ms11p00im-qufv10072901.me.com [10.9.18.26])
 by ms11p00im-qufo17291301.me.com (Postfix) with ESMTP id 9430310026A
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 23:41:38 +0000 (UTC)
To: alsa-devel@alsa-project.org
From: Jefferson Smith Pizarro Gutierrez <jpi59@icloud.com>
Subject: Fwd: Asus Xonar SE
Date: Sat, 04 Jul 2020 23:41:38 -0000
X-Mailer: iCloud MailClient2010Project52
 MailServer2011B332.10000-Famine2011-0-e73dd42b508f
Message-id: <95deb695-ebd2-419f-8de3-031642e73bfe@me.com>
MIME-Version: 1.0
References: <ef670267-4d54-444d-9422-d52008b2824d@me.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-04_17:2020-07-02,
 2020-07-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=608 adultscore=0 classifier=spam adjust=0 reason=mlx
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

my o.s is Debian 10.4=0A=0A=0AComienza el mensaje reenviado:=0A=0A=0ADe: J=
efferson Smith Pizarro Gutierrez <jpi59@icloud.com>=0AFecha: 4/7/2020=0APa=
ra: alsa-devel@alsa-project.org=0AAsunto: Asus Xonar SE=0A=0A=0Ahi, i have=
 issues with my Asus Xonar SE souncard,=C2=A0 i need to get a solution, pl=
ease helpme to get sound through=C2=A0 the spdif of the soundcard. i dont =
have sound
