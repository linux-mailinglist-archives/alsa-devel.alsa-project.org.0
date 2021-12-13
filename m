Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168234733E8
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 19:22:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94DEA188F;
	Mon, 13 Dec 2021 19:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94DEA188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639419730;
	bh=fMZ2AzEu4rao5UWq6NSt9BUbVs6DDipys/Xkcd3b9Io=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uOYWQ/2xRLmwQlV1syKIaYvNElVhJcWU/GMc2BFvspntnnCEglpIME6VXisbRwozV
	 cg5rpNU4uk+uORL2BbvUPcJDdbxDlzkepRu7gU6c7kMsAkaaflGPichbtD3dymgPUV
	 +mjoKgCa4aeE9jCfhHZpB9GlbPrfgk/TTwREmNeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB51AF8025F;
	Mon, 13 Dec 2021 19:21:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B7BFF8016A; Mon, 13 Dec 2021 19:21:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from vsmx001.mijndomein.xion.oxcs.net
 (vsmx001.mijndomein.xion.oxcs.net [157.97.78.141])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C18EDF8016A
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 19:20:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C18EDF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tarmack.eu header.i=@tarmack.eu
 header.b="VRDWiSJN"
Received: from vsmx001.mijndomein.xion.oxcs.net (unknown [10.93.2.1])
 by mx-out.mijndomein.xion.oxcs.net (Postfix) with ESMTP id 9773A34D44B3
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:20:51 +0000 (UTC)
Received: from proxy-7.proxy.shared.ns.xion.oxcs.net
 (proxy-7.proxy.shared.ns.xion.oxcs.net [77.167.248.94])
 by mx-out.mijndomein.xion.oxcs.net (Postfix) with ESMTPA id 599E2A4038E
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tarmack.eu; s=mail1;
 t=1639419651; bh=GSSGpsV1qcNvhNvhkSX1mpNX/qCZx1Y2CjPDjdZ//CI=;
 h=Date:From:Subject:To:From;
 b=VRDWiSJN+KnIpprul6f2fziri7Ox4l8aioMXX6q8/I3L+HDEmXT6HVSomCUhkmToT
 8DwmVP5EIOotD54irMTiMt/qbT5XDAvJJgSm/pGStfHGMNBpnAgcH7/jAZ5kvhQVvf
 JCzIOia6jD9SFUH1NjFGxzYtCruuAx7gUWUTp3cQ=
Received: from [192.168.3.35] (unknown [192.168.3.35])
 by postoffice.localdomain (Postfix) with ESMTP id 10391C02EA
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:20:39 +0000 (UTC)
Date: Mon, 13 Dec 2021 19:20:43 +0100
From: Bart Kroon <bart@tarmack.eu>
Subject: [PATCH] ALSA: hda: ALC287: Add Lenovo IdeaPad Slim 9i 14ITL5 speaker
 quirk
To: alsa-devel@alsa-project.org
Message-Id: <JAG24R.7NLJGWBF4G8U@tarmack.eu>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-dyxCLnjHcl8LNpyb+4UH"
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT
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

--=-dyxCLnjHcl8LNpyb+4UH
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

The speaker fixup that is used for the Yoga 7 14ITL5 also applies to
the IdeaPad Slim 9i 14ITL5. The attached patch applies the quirk to 
initialise the amplifier on the IdeaPad Slim 9i as well.

This is validated to work on my laptop.

Signed-off-by: Bart Kroon <bart@tarmack.eu>

Regards,
Bart


--=-dyxCLnjHcl8LNpyb+4UH
Content-Type: text/x-patch
Content-Disposition: attachment; filename=snd-ideapad-slim-9i.patch
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggOGEzZTJmZTQyMTA2Li5kZThmNGU5YzI4OWQgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCkBAIC04ODUxLDYgKzg4NTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgx
N2FhLCAweDM4MjcsICJJZGVhcGFkIFM3NDAiLCBBTEMyODVfRklYVVBfSURFQVBBRF9TNzQwX0NP
RUYpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4NDMsICJZb2dhIDlpIiwgQUxDMjg3X0ZJ
WFVQX0lERUFQQURfQkFTU19TUEtfQU1QKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzODEz
LCAiTGVnaW9uIDdpIDE1SU1IRzA1IiwgQUxDMjg3X0ZJWFVQX0xFR0lPTl8xNUlNSEcwNV9TUEVB
S0VSUyksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzgzNCwgIkxlbm92byBJZGVhUGFkIFNs
aW0gOWkgMTRJVEw1IiwgQUxDMjg3X0ZJWFVQX1lPR0E3XzE0SVRMX1NQRUFLRVJTKSwKIAlTTkRf
UENJX1FVSVJLKDB4MTdhYSwgMHgzODUyLCAiTGVub3ZvIFlvZ2EgNyAxNElUTDUiLCBBTEMyODdf
RklYVVBfWU9HQTdfMTRJVExfU1BFQUtFUlMpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4
NTMsICJMZW5vdm8gWW9nYSA3IDE1SVRMNSIsIEFMQzI4N19GSVhVUF9ZT0dBN18xNElUTF9TUEVB
S0VSUyksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzgxOSwgIkxlbm92byAxM3MgR2VuMiBJ
VEwiLCBBTEMyODdfRklYVVBfMTNTX0dFTjJfU1BFQUtFUlMpLAo=

--=-dyxCLnjHcl8LNpyb+4UH--

