Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 842F812F5D5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:58:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F9B41787;
	Fri,  3 Jan 2020 09:57:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F9B41787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041913;
	bh=qm43ejMhD6wCx5obhpbGTJs1o2ZfcfOi8R6sTnS4+Ak=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MGaRlReguFWT1C5q49MFLD1zh4GHzU7MNyN5nbSLTqoZVWBok9ske86MLxmX28sFn
	 GyNWz3ZMSGGIk2b/dql5N1rVsw2fv63jtyyN1VBcKwesDZFvFLh8f+7S8XHN24Morg
	 OVXmPyhylDO0qr5MfpQhRGJ4Xf0MteZfpq43KTyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E01EFF802BC;
	Fri,  3 Jan 2020 09:20:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CA7BF80157; Fri,  3 Jan 2020 02:57:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.1 required=5.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 PRX_APP_ATTACH, PRX_BODY_13, PRX_BODY_135, SPF_HELO_NONE, SPF_NONE,
 SURBL_BLOCKED, 
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from tpecef01.compal.com (exmail3.compal.com [59.120.207.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4170F8013E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 02:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4170F8013E
X-UUID: bb65d860ee0342b889c2af2bdeae80a3-20200103
Received: from tpembx01.compal.com [(10.110.15.26)] by tpecef01.compal.com
 (envelope-from <aj_cheng@compal.com>)
 (Cellopoint E-mail Firewall v4.1.6 Build 0408 with TLS)
 with ESMTP id 1736225997; Fri, 03 Jan 2020 09:57:05 +0800
Received: from TPEMBX05.compal.com (10.110.15.29) by TPEMBX01.compal.com
 (10.110.15.26) with Microsoft SMTP Server (TLS) id 15.0.995.29; Fri, 3 Jan
 2020 09:57:04 +0800
Received: from TPEMBX01.compal.com (10.110.15.26) by TPEMBX05.compal.com
 (10.110.15.29) with Microsoft SMTP Server (TLS) id 15.0.995.29; Fri, 3 Jan
 2020 09:57:03 +0800
Received: from TPEMBX01.compal.com ([fe80::1942:f41b:515b:f225]) by
 TPEMBX01.compal.com ([fe80::1942:f41b:515b:f225%16]) with mapi id
 15.00.0995.028; Fri, 3 Jan 2020 09:57:03 +0800
From: <AJ_Cheng@compal.com>
To: <intel-gfx@lists.freedesktop.org>, <alsa-devel@alsa-project.org>
Thread-Topic: USB Type-C monitor flashes once when play a video file after
 unplug and re-plug the monitor
Thread-Index: AdXB0nlM5qaLFlJOTlavFS+ZjDjiAw==
Date: Fri, 3 Jan 2020 01:57:03 +0000
Message-ID: <d7aba6970fbd48f2b32e2bc6d838ab20@TPEMBX01.compal.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.110.15.241]
X-TM-SNTS-SMTP: 403C9FDEFFC975AC44920C8AA31028E8731995EBB058783C2FF706CCA0F669922000:8
Content-Type: multipart/mixed;
 boundary="_004_d7aba6970fbd48f2b32e2bc6d838ab20TPEMBX01compalcom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 03 Jan 2020 09:20:45 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: nathan.d.ciobanu@linux.intel.com, CindyXT_Wang@compal.com,
 Nelson_Ye@compal.com, Shane_Yap@compal.com, Lucien_Kao@compal.com,
 Evan_Tseng@compal.com
Subject: [alsa-devel] USB Type-C monitor flashes once when play a video file
 after unplug and re-plug the monitor
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

--_004_d7aba6970fbd48f2b32e2bc6d838ab20TPEMBX01compalcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Sirs,
        Here is chromebook SW team from Compal=2E
As the mail title, we hit issue that the external monitor will flash once =
when play video after hot pluging=2E
We can reproduce not only on chromebook but also ubuntu 16=2E04=2E
There has higher failure rate with Dell Solomon dock and Dell S2718D =
monitor=2E

We found adding the delay in "sound/pci/hda/patch_hdmi=2Ec " can fix this =
issue=2E(as the attachment)
May need your help to review and advice=2E Thanks=2E

Here is the issue number in gitlab for more detail=2E
https://gitlab=2Efreedesktop=2Eorg/drm/intel/issues/318



AJ Cheng
NID/NID1
e-mail: AJ_Cheng@compal=2Ecom<mailto:AJ_Cheng@compal=2Ecom>
Tel:  +886-2-8797-8599 ext=2E 17561
Mobile : +886-932827829
COMPAL Electronics, Inc=2E


--_004_d7aba6970fbd48f2b32e2bc6d838ab20TPEMBX01compalcom_
Content-Type: application/octet-stream; name="flash_once.diff"
Content-Description: flash_once.diff
Content-Disposition: attachment; filename="flash_once.diff"; size=593;
	creation-date="Mon, 16 Dec 2019 06:29:48 GMT";
	modification-date="Mon, 16 Dec 2019 06:29:48 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jIGIvc291bmQvcGNpL2hkYS9w
YXRjaF9oZG1pLmMKaW5kZXggNDQ0OGFiNi4uNzdkYzZiOSAxMDA2NDQKLS0tIGEvc291bmQvcGNp
L2hkYS9wYXRjaF9oZG1pLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9oZG1pLmMKQEAgLTg1
NCw3ICs4NTQsNyBAQCBzdGF0aWMgdm9pZCBoYXN3ZWxsX3ZlcmlmeV9EMChzdHJ1Y3QgaGRhX2Nv
ZGVjICpjb2RlYywKIAkgKiBjb252ZXJ0ZXJzIGFyZSBpbiBjb3JyZWN0IHBvd2VyIHN0YXRlICov
CiAJaWYgKCFzbmRfaGRhX2NoZWNrX3Bvd2VyX3N0YXRlKGNvZGVjLCBjdnRfbmlkLCBBQ19QV1JT
VF9EMCkpCiAJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGN2dF9uaWQsIDAsIEFDX1ZFUkJf
U0VUX1BPV0VSX1NUQVRFLCBBQ19QV1JTVF9EMCk7Ci0KKwltc2xlZXAoNDApOwogCWlmICghc25k
X2hkYV9jaGVja19wb3dlcl9zdGF0ZShjb2RlYywgbmlkLCBBQ19QV1JTVF9EMCkpIHsKIAkJc25k
X2hkYV9jb2RlY193cml0ZShjb2RlYywgbmlkLCAwLCBBQ19WRVJCX1NFVF9QT1dFUl9TVEFURSwK
IAkJCQkgICAgQUNfUFdSU1RfRDApOwo=

--_004_d7aba6970fbd48f2b32e2bc6d838ab20TPEMBX01compalcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_004_d7aba6970fbd48f2b32e2bc6d838ab20TPEMBX01compalcom_--

