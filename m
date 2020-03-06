Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D78BE17D249
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 08:48:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097501672;
	Sun,  8 Mar 2020 08:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097501672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583653727;
	bh=rf68DsMPVrmVekTr0QhLG4WLcf+j3ZG2SJHd5BTYz8o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J1XDbk+VccauLugxiMwOo3MsEDk0igFCByHysmltPzqQ8aEWs9qSWfiW5bFsfBjB9
	 93XfPkMAhqbTG0pVJ1ISmqvdCj2HErNtbVzVKXOupVY8rDEfe7i+AypojnpnTKx7is
	 IQxAKJd54/PlhHwu9MoU6PzqwX/DQew9igVLKZdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22132F8024A;
	Sun,  8 Mar 2020 08:46:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92FB9F801ED; Fri,  6 Mar 2020 22:10:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CCC9F80125
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 22:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CCC9F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dvd3An2G"; 
 dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com
 header.i=@cirrus4.onmicrosoft.com header.b="njew15rE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026KvJnY009995; Fri, 6 Mar 2020 15:10:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=PODMain02222019;
 bh=ne1C7WGsPwwgw8GX7UeNPErRuNboXDAqQL5R3wXVxcA=;
 b=dvd3An2GVGjU985cYGBvOX+IaTHkGaA4BIVjnwRv1uYQ+1GUffWDO+JZGxv22PZktlBI
 7yeuiTPDfoIkyOW8iAvdUDutDfikVluKeIj9U/YwTdM1EmG2dRuabixFelXolubTMfBn
 bs9OTFCd2NEXzkK3axUWLl7/9hH5tcnas/ti7yLXwAoXpm+RErP/Ze359uGp0/CzBxU9
 N9a8QPLoB1+7iEssl/Li04KPgTowjZfdAtqP7Q+KP/Dt0sLMvKeNk2TSO+UT8jDhQTpp
 J5jEheGxLYfRju22QgGOzb5k/Ju5dN7wm0ZaSeQUfWDnVCjQeilOStjlvC4e5dP3fcfQ NQ== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=James.Schulman@cirrus.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
 by mx0b-001ae601.pphosted.com with ESMTP id 2yfn8vku3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:10:41 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NggTYrCswjf/G+NOjlBXS2W1BdM6E6V1LHVXdEqtRl3ONNCAKnsHNtrrEl0ql0lElaUd/Buceh0rAGM8HL+7u+OLqkfuX1H6dG8mZDhcRPXa5Fgnta+oZNAOlbYX+Cj9dVaQeM5wdN9kk5d6/KGJT9zke98i96xeUX2BXKxzQjwsUZB2a0SAyfWn5BxqzKyMk0biloPgS5SQjeh0cWfIJ1c78S4Ll6Mhax4RECK6X6etE/iXFtdK5TgeNwY/9lCv/KsafuCAfoJn9fIF4aNwXnkcuU+XWTJ+sv3eYyE+o5r217qz5nC2yMYjRE1eIPUM2+DjMI116u8H3IzmO+29fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne1C7WGsPwwgw8GX7UeNPErRuNboXDAqQL5R3wXVxcA=;
 b=GUgEewvO4VzK7gTvMl+2+aFKTQELB844a4rPaeLhmcIy+sEYJKD1po3QcyADgIo2dXwFJWoY+g/6YA+GOPWr3MyAVWKMMTzidmiBxbH3eBGwBJanXKMO6GIQg35shQ/9kme0tZTN6LY6kPlOqmT8r9ADGp1358fT4NB2kn0kxpSNFVd3tCasOxJ3AJaTauJR/SL4xQGvmDKJPHyrt0RbVRI/UcbhN+L7XxdpJuJWxzDo8vteMH2e4z5hh1ogMFJ4kSWMDkfXvX0oGEx4OPVN5D+xzamuoxHEbKLgQ2M/wSJXXqbO3dthqGEnNGqskw7746yzXlGm6K6jkICbZrHMcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne1C7WGsPwwgw8GX7UeNPErRuNboXDAqQL5R3wXVxcA=;
 b=njew15rERj2BTxUZv5J0+J7G/wtrPiM9AoHxsfMk82soPvfb6v3fScq00BArS9tYKHKkHdH3NvbdqcJsCkieJpO4PMRWYM9W9nXhLwC6aNMZkodlLYo6SUZYuzYkOcW3gml7NQ5LbNB/lwL1LaFp+a30HzSFu8K5t1Q/tltGl0w=
Received: from SN6PR19MB2381.namprd19.prod.outlook.com (2603:10b6:805:64::29)
 by SN6PR19MB2367.namprd19.prod.outlook.com (2603:10b6:805:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15; Fri, 6 Mar
 2020 21:10:38 +0000
Received: from SN6PR19MB2381.namprd19.prod.outlook.com
 ([fe80::b403:4378:5e7b:4b18]) by SN6PR19MB2381.namprd19.prod.outlook.com
 ([fe80::b403:4378:5e7b:4b18%3]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 21:10:38 +0000
From: "Schulman, James" <James.Schulman@cirrus.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers
Thread-Topic: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers
Thread-Index: AQHV8/uvTLLDbdTF00mNe25R2BUq/g==
Date: Fri, 6 Mar 2020 21:10:38 +0000
Message-ID: <alpine.DEB.2.21.2003061508150.32557@james-tower>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.131.2.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82dec954-54fc-41c5-0dfc-08d7c212d228
x-ms-traffictypediagnostic: SN6PR19MB2367:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR19MB2367D1C2F9BA20A2446E8D6FE4E30@SN6PR19MB2367.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0334223192
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(7916004)(376002)(39850400004)(366004)(136003)(396003)(346002)(189003)(199004)(107886003)(478600001)(26005)(66556008)(6506007)(186003)(76116006)(64756008)(4326008)(66446008)(66476007)(110136005)(66946007)(316002)(91956017)(2906002)(5660300002)(15650500001)(86362001)(33716001)(6486002)(71200400001)(4744005)(81156014)(81166006)(6512007)(54906003)(8936002)(8676002)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR19MB2367;
 H:SN6PR19MB2381.namprd19.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cirrus.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oxVuTCIgBMvtW6pt1o+A2dV5OHOcCGr9cw3jpfh6oaVz7Fwr5uHp8i+FBojPZazxv7hFW2JqawInQwuqkxF89FS8ziH2V5J8cTcg3gyGf7hP81gFzHXE0ri9b02jlmUEl+TkBw/qFg5tnK3hZWWCqtNiTsa9RwgGO47I5vwtdZBtiy4/KnpG84byw+gLNvsb5oN6nV3Q13u/g0yJAOZZU5/+nazBKX/Eqng6+mPPXe+1+ZOtXnqMJkmaiCu8xGaazrprhy3VfWs5O9c9awTc48vpW3mZmvLqFhYcx3/0FPsqD0h3J2+2CZqFytf3ChIYnkxY1VFE5X92oaELwcNljiMlDKzQJgyqJ5rKkNUPbnVRtcwlxZztTVQHSCmd91mNNaGs91mqUtYby4hEa7R/ZWKpHX02XzTPWByLeqoMsPrgX0VXm2IEyCQp1Zr7CTqI
x-ms-exchange-antispam-messagedata: auRMp/5cwXMTLk+KDsHV2VQcY4aHU30ZT9HgoK7RMjImnlu6LmRm6Roi24N6xIIdwDX1fFeRuqk4YPD33QKnGp5fR8Tflng9VPuF4Fl7aBX8LF5YOCX+VpPmYkQVHktoyCo3Iekq1TtEI/ueRLYFRw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8164D63C9827F9428D774CD85257F257@namprd19.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82dec954-54fc-41c5-0dfc-08d7c212d228
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2020 21:10:38.6025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zksLtBCy0xATJEbqYs/EhjnrMKe05uQNKGxi523frDgx/p4LMuU5r3a9l58o2r73os3xW54tqZFcY29DwgTFxi/LZivRYDTZ6DFWsPNI91Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR19MB2367
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 include:_spf1.cirrus.com include:_spf2.cirrus.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=943 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060123
X-Mailman-Approved-At: Sun, 08 Mar 2020 08:46:09 +0100
Cc: "Austin, Brian" <Brian.Austin@cirrus.com>, "Handrigan,
 Paul" <Paul.Handrigan@cirrus.com>, "Rhodes, David" <David.Rhodes@cirrus.com>
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

Brian & Paul are no longer active audio codec driver
maintainers. Update list to reflect myself and David
Rhodes as the active maintainers.

Signed-off-by: James Schulman <james.schulman@cirrus.com>
---
   MAINTAINERS | 4 ++--
   1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6158a143a13e..05379f8bc8e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4021,8 +4021,8 @@ F:
Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
   F:      sound/soc/codecs/cros_ec_codec.*

   CIRRUS LOGIC AUDIO CODEC DRIVERS
-M:     Brian Austin <brian.austin@cirrus.com>
-M:     Paul Handrigan <Paul.Handrigan@cirrus.com>
+M:     James Schulman <james.schulman@cirrus.com>
+M:     David Rhodes <david.rhodes@cirrus.com>
   L:      alsa-devel@alsa-project.org (moderated for non-subscribers)
   S:      Maintained
   F:      sound/soc/codecs/cs*
--
2.17.1=
