Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E045369
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 06:24:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F191858;
	Fri, 14 Jun 2019 06:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F191858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560486283;
	bh=Vqw+r59h+NKHvrjsDJLVUGiLn3GctG6OV7Vr89X0Ag0=;
	h=Date:From:To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Z/+UE0WyQEKCogtYzOqBq8xGDwL7Al5/oyXmE6HC89549MAZ3bypcryRcbegEIX6k
	 gPccoL/fcepMfG0rWQOsHSPiJPhWAQcC0pTIlg+ydNcIWBKCj7YQTMNLuCTWfriZ0W
	 9Hy34viFhBmx0xPTWHTy6MaJuaskshIBLJjZpaR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F10AF896E3;
	Fri, 14 Jun 2019 06:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADDB6F896E0; Fri, 14 Jun 2019 06:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from sonic317-21.consmr.mail.gq1.yahoo.com
 (sonic317-21.consmr.mail.gq1.yahoo.com [98.137.66.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0572F80764
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 06:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0572F80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="jzC++jWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1560486169; bh=IqrS33jKcdOay2/N2DWCJLfupic+iVZuDF2LvYonJTk=;
 h=Date:From:To:Subject:References:From:Subject;
 b=jzC++jWpupHGIbIWC3LkkWE881swC3AKhN5x9blde+/TjJVdPjVu5q8YEZDH3yNxXb/me69ViqMHIIFWq1/tU75kHCkwr2De8GAYHcHnXu8kO2OKUVzud4hOoFSxjdJAVJqk9cdv/r+2ibUv8VQcjAvC6j4QqoKiETd4f4UcKrAbjnkH/q+YQwEk251l93ewH4Rw6tds9Fonxe1Lu2C9Uzq7CkcOlNjAlnKz+8jkbFvTKLe37jZBs9ZoFrtcNtiFMeBSXkqsGwbmqk73m9KF7caYRalyDFWxkUa1GAI6qcBYF3cVGq4XKwigWcmqx6OFmrG26XEhQdQD/Pckn8cktA==
X-YMail-OSG: SljgH5UVM1msgELP7.Dmz7ThVIrp3LT2FFiPmbxuosOsiRDfA2OJMf2uYX6a3wC
 r1Qt8QysTGfSnLyS_fP69939uCnT6H7fnP2lOOaSIL.9IHex_AD0JnhbloqXhBT6VQS7VTdk9VEh
 0qaZF6tekIQjl4ftEgIsiIowWkgFbuHVRQ2VmdmeI2WKLIUHhFVtwYOZ0J13uvws3C7XXm1SFyF6
 mBLBeTedOVbxthcJQJumZvOhPamtjSSLdvczCKWWyichqr4WMShkz6k5Kv04WL8rP_n57nneYi1L
 7yxyFL46IP51e4eAlJgSx1.kSsW5SVjjjNpyICvXmt4IvmeDGdme0X20Ao30gGSU8yr8DFZ6SAEE
 W_4BQglsT_3RFCz1ZnAmxVqG6oAsR..iX3a8Lich._CuBotjQ5Y8Kr_O4G8WOrJt5d8gbHfSoZn5
 Ll0YzEJ3Rm4XSH9t_X1lyQABYQbbd_jSBsAnSOkOhMHPAw8_oU6gJE7TA6lINkF.rBXm_jhQgLLR
 eUilfXw1P7IY6qaOnPMmhnjebM3YGc10twkBIStRi.Ou9YwA_bJVA542n1FzgmtiCGn7biOKnuQo
 K4_vMOR80SSQalywXNXbiLx1Wy3t1ozY40G_XFccEPMtzfKY7dMOTwdf02UnVPrDYqUQxpKbehAL
 zLtRA0Qvunk8fz0azJmiMj5Tzf3BgE4TB.QihglLn9mBZOKIZkxRK0iIrIUFY0a.LHPLViX6S3H.
 Ui9q2ElpsBKplwyhhM8BVLdQTDWjH.Uv1.pCLdv1j_DMpTBIhpJ2.3OeXpghZmJG5ljUTbWpUkCs
 eveLc.3ITU7uwK8USJ9ilr_PC80uSq9uPtoA7YEY_Z1KJfQJqepneK7zpTntptPUA7FFBTPfkEZX
 qi9ap5IVPwZ9u3uVnTqXpwrd8ntZuSFgtGnNFlm6fcarl.PUyTX1CY_dkyRmsm2LlGA5YkG_6R5g
 GJUiY9z0x66IKx9tatfGa1JtStCyB49kL0zP113J56Py_iu90pdidG_7gC_q310AnooBTmeRasyu
 6TelVu2cwGce_rvOibbZVhJIPrOoU0BxPI7wAxPJtwtSLIqR80Bi8UuhczKIYJc0jdysVIH0jPO8
 5MlImgsuCjZeML1cCOAoKbY0xp59Ty8MuBDfiWgJJwEaVEWG.sfaCIK7Egr1ewCvxZeww93r5mwH
 yU1F4vSEpf3X4J3..LWdqG7HiwIET.flMlhmBqCIohnJthxWg2Cad93jqAYo5f4WDoz4JJcoM
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Fri, 14 Jun 2019 04:22:49 +0000
Date: Fri, 14 Jun 2019 04:22:44 +0000 (UTC)
From: Mark Moreno <mark_c_moreno@yahoo.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Message-ID: <301632265.1084254.1560486164482@mail.yahoo.com>
MIME-Version: 1.0
References: <301632265.1084254.1560486164482.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13837 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64; rv:67.0) Gecko/20100101 Firefox/67.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] PortAudio/Alsa devices question on linux
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SSBidWlsdCBwb3J0YXVkaW8gb24gcmg3NSBpbiBpdHMgbm9ybWFsIDY0IGJpdCBtb2RlIGFuZCB3
aGVuIEkgcnVuIGl0cyB0ZXN0IHByb2dyYW0gcGFfZGV2cyB3aGljaCBsaXN0cyB0aGUgYXVkaW8g
ZGV2aWNlcyBhdmFpbGFibGUsIG15IHVzYiBzb3VuZCBjYXJkIGRldmljZSBpcyBsaXN0ZWQgYW5k
IG15IGFwcGxpY2F0aW9uIHRoYXQgdXNlcyBwb3J0YXVkaW8gd29ya3MgZmluZS4KSSBidWlsdCBw
b3J0YXVkaW8gb24gcmg3NSBpbiAzMiBiaXQgZm9ybSBhbmQgd2hlbiBJIHJ1biBpdHMgdGVzdCBw
cm9ncmFtIHBhX2RldnMgdG8gbGlzdCB0aGUgZGV2aWNlcywgaXQgZG9lc24ndCBsaXN0IG15IHVz
YiBzb3VuZCBjYXJkIGFuZCBzbyBteSBhcHBsaWNhdGlvbiBkb2Vzbid0IHdvcmsuCldoeSB3b3Vs
ZCBhIHVzYiBhdWRpbyBzb3VuZCBjYXJkIGJlIHNlZW4gYnkgYSA2NGJpdCB2ZXJzaW9uIG9mIHBv
cnRhdWRpbyBhbmQgbm90IGJ5IGEgMzJiaXQgdmVyc2lvbsKgIG9mIHBvcnRhdWRpbz8gSSBhc3N1
bWUgaXQncyB1c2luZyBhbHNhIHVuZGVyIHRoZSBob29kIHNvIG5vdCBzdXJlIHdoeSB0aGVyZSB3
b3VsZCBiZSBhbnkgZGlmZmVyZW5jZS4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyBvbiBteSBSSDc1
IGxpbnV4IGluc3RhbGwgb3IgPz8/CnRoYW5rc01hcmsgTW9yZW5vCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
