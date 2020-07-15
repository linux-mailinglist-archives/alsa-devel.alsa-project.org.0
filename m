Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2538220DAB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 15:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E6D1673;
	Wed, 15 Jul 2020 15:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E6D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594818591;
	bh=7q2MhdC8jY/OY1LEtd6N51+Ebju7xdn1bA5jdb3sKNs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e68k4gXReVYjujotdShSOXtrs28/oP9UpT1YHwaDUWu4wCNnNYkGooIh62mVjwU3B
	 oFJo/+/xs5Btsy7q1Lo2R12gQ4DrQ0UgzaBeYzqhLo3mCQUXUv0iqrrUe/tCc1cHw/
	 2SCOHdR3IPXPNzRARi7fmiEWF4Cmcm+ziwYMatqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F242FF800E8;
	Wed, 15 Jul 2020 15:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 367EBF8023F; Wed, 15 Jul 2020 15:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11723F8021D
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11723F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="N6rksJnO"
Received: from fe0vm1650.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 4B6HjR2gBPz1XLDQx
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1594818443;
 bh=lTRHHH5pLOCC/NgH0JLYxDPtMBfZiBkhg7ESBbry+Sg=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=N6rksJnOQ0FIN7VMAN3rbJF2TV7UbHPVIwnpFYrwWNIcfFFEPh0sXbUzcEPvJXEkw
 sF8Zei+zSIGs+fvYJ7YnUF7VbBkMx5VpjQUEwGCvnSFH1A7sLrB4GTSaei5Cvia0A6
 bV+8+0MLUMTZx0pM6LQOfBEHW3qxjeMHZr2KFmzY=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 4B6HjR2PvMz1rM
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:07:23 +0200 (CEST)
X-AuditID: 0a3aad12-235ff700000028b1-ad-5f0eff8b264e
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id 1F.3F.10417.B8FFE0F5;
 Wed, 15 Jul 2020 15:07:23 +0200 (CEST)
Received: from FE-MBX2074.de.bosch.com (fe-mbx2074.de.bosch.com [10.3.231.179])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 4B6HjR1PfNz6CjZP6
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:07:23 +0200 (CEST)
Received: from SGPMBX2012.APAC.bosch.com (10.187.83.41) by
 FE-MBX2074.de.bosch.com (10.3.231.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Wed, 15 Jul 2020 15:07:22 +0200
Received: from SGPMBX2012.APAC.bosch.com (10.187.83.41) by
 SGPMBX2012.APAC.bosch.com (10.187.83.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Wed, 15 Jul 2020 21:07:21 +0800
Received: from SGPMBX2012.APAC.bosch.com ([fe80::9cea:9250:3b02:f173]) by
 SGPMBX2012.APAC.bosch.com ([fe80::9cea:9250:3b02:f173%4]) with mapi id
 15.01.1979.003; Wed, 15 Jul 2020 21:07:21 +0800
From: "Vijay Palaniswamy (RBEI/ECF3)" <Vijay.Palaniswamy@in.bosch.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: [DMIX Plugin] Using Different bindings for same Alsa card
Thread-Topic: [DMIX Plugin] Using Different bindings for same Alsa card
Thread-Index: AdZapglMATcdeBlsTgix8/f3gWAHkg==
Date: Wed, 15 Jul 2020 13:07:20 +0000
Message-ID: <d2e0758638f54ddb9fce57fc85f61d27@in.bosch.com>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.212]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42Lhslorq9v9ny/e4HiDoMWVi4eYHBg9Nnxu
 YgtgjOKySUnNySxLLdK3S+DKmN05j7XgaD9jxf0VN1gaGG92M3YxcnJICJhIbJl6grmLkYtD
 SGAGk8TRA6uYIJyHjBI9RxawQTgfGSUO/DrNCOF8ZpT49PouVM8RRomDn6ezgAxjE3CTeHH8
 IxuILSJgL/H+/GowW1jASWLjnVcsEHF3iX9XP7J3MXIA2XoSn1f5g4RZBFQl3j2eDnYTr4C1
 xLTNjWCtjAKyEotuTgJrZRYQl7j1ZD4TxN0CEkv2nGeGsEUlXj7+xwphK0r0/u1mg6hPktjx
 ayoLxExBiZMzn7BMYBSZhWTULCRls5CUzQK6jllAU2L9Ln2IEkWJKd0P2SFsDYnWOXPZkcUX
 MLKvYhQtzjQoyzUxMzHSK0pKLa4yMNRLzs/dxAiJJaEdjL86PugdYmTiYDzEKMHBrCTCy8PF
 Gy/Em5JYWZValB9fVJqTWnyIUZqDRUmcV4VnY5yQQHpiSWp2ampBahFMlomDU6qBqX1D2HPl
 GY6sq79KyC+Ki9pRqnT/6KL+nc6fi2f6anyr/zDr0HG7iVtze48ziZzZJbSdMcs7gSveh2lz
 5pm0K7maMXNj2BsCinzWd4nse2uz5knNNovf8Y/evZZae39e+7eDfLxCmV+y1LfoJq89kBn9
 cyaDeHWP9KbHzw4yc27rzjfWuCJTcVuO27ZumnHVLdHZajet708tUZtQ0eh49PrirdMUFy6O
 k2X806bdrnRIKmNORpH0m0Q7xWfRy6Se1a0K1T3xOCblYj7TqpzTB3Z5Z85hurZEYW34J1eX
 EBHHme6d+TeXRhmnr2acsHhHkrDi/QNXHRbe4azRY7kpm7jpxSm7tpAjxQcXNZ/aqMRSnJFo
 qMVcVJwIALHZuMYUAwAA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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

SGkgQWxsLA0KDQpJIGhhdmUgdHdvIHZpcnR1YWwgZGV2aWNlIHBvaW50aW5nIHRvIHNhbWUgQWxz
YSBjYXJkICx3aXRoIGRpZmZlcmVudCBiaW5kaW5ncw0KV2hlbiBhdWRpbyBwbGF5ZWQgb24gYm90
aCBkZXZpY2UgW2RtaXhfNF9jaGFubmVscyBhbmQgZG1peF8yX2NoYW5uZWxzXSBpbiBwYXJhbGxl
bC4gQXVkaW8gcGxheWVkIG9uIGRtaXhfMl9jaGFubmVscyBpcyBnZXR0aW5nIGNvcnJ1cHRlZC4N
Cg0KVmFsaWRhdGVkIHdpdGggYWxzYSB2ZXJzaW8gOiAxLjIuMw0KDQpQbGVhc2UgbGV0IG1lIGtu
b3cgaG93IHRvIG1ha2UgaXQgd29yayB3aXRoIGJlbG93IGNvbmZpZ3VyYXRpb24uDQoNCkFsc2Eg
Y29uZmlndXJhdGlvbiB1c2VkIGZvciB0ZXN0aW5nOg0KKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKg0KcGNtLmRtaXhfNF9jaGFubmVscyB7DQogICAgICAg
IHR5cGUgZG1peA0KICAgICAgICBpcGNfa2V5IDU2NzgyOTMNCiAgICAgICAgaXBjX3Blcm0gMDY2
MA0KICAgICAgICBpcGNfZ2lkIGF1ZGlvDQogICAgICAgIGJpbmRpbmdzIFswIDEgMiAzXQ0KDQog
ICAgICAgIHNsYXZlIHsNCiAgICAgICAgICAgICAgICBwY20gImhhcmR3YXJlIg0KICAgICAgICAg
ICAgICAgIGNoYW5uZWxzIDQNCiAgICAgICAgICAgICAgICBwZXJpb2RzICA0DQogICAgICAgICAg
ICAgICAgcGVyaW9kX3RpbWUgNDAwMDANCiAgICAgICAgfQ0KfQ0KDQpwY20uZG1peF8yX2NoYW5u
ZWxzIHsNCiAgICAgICAgdHlwZSBkbWl4DQogICAgICAgIGlwY19rZXkgNTY3ODI5Mw0KICAgICAg
ICBpcGNfcGVybSAwNjYwDQogICAgICAgIGlwY19naWQgYXVkaW8NCiAgICAgICAgYmluZGluZ3Mg
WzAgMV0NCg0KICAgICAgICBzbGF2ZSB7DQogICAgICAgICAgICAgICAgcGNtICJoYXJkd2FyZSIN
CiAgICAgICAgICAgICAgICBjaGFubmVscyAyDQogICAgICAgICAgICAgICAgcGVyaW9kcyAgNA0K
ICAgICAgICAgICAgICAgIHBlcmlvZF90aW1lIDQwMDAwDQogICAgICAgIH0NCn0NCg0KcGNtLmhh
cmR3YXJlIHsNCiAgICAgICAgdHlwZSBodw0KICAgICAgICBjYXJkIDANCiAgICAgICAgY2hhbm5l
bHMgNA0KICAgICAgICByYXRlIDQ4MDAwDQogICAgICAgIGZvcm1hdCBTMTZfTEUNCn0NCg0KKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KDQpCZXN0IHJl
Z2FyZHMNCg0KUGFsYW5pc3dhbXkgVmlqYXkNCg0K
