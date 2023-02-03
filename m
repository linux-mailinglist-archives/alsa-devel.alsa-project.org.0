Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92879688F49
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 07:01:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D15F41;
	Fri,  3 Feb 2023 07:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D15F41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675404104;
	bh=Jwr8TG/Nppd7t8KnilPP8ahE5P5oLZvgKaEGU5DoE98=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=J00ch4fee0vQm4U+f2mmcGU4FSFu+jgC27NQtO6ClIYZ3RBy34bemDtl1gKhnB65F
	 FSnFaQMIwZKzmf8T+2o1oAq4LEkGKS3aggo4Az0dB6BWgj6I85/LWOo4nNb0LCbjoj
	 PxlK3SxATCT4pwOXcFlTgq2Rnre9bV1n0qylytmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1BE8F80423;
	Fri,  3 Feb 2023 07:00:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AECDF8032B; Fri,  3 Feb 2023 07:00:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81F0FF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 07:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F0FF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256
 header.s=default header.b=Eircr6Tf
Received: from f378.i.mail.ru (unknown [45.84.128.187])
 by mail.ispras.ru (Postfix) with ESMTPSA id CC04540737AF;
 Fri,  3 Feb 2023 06:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru CC04540737AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1675404026;
 bh=BiwSDlJZtLa15OzMKaVS9eNRl5+1PHmLRLC73g9o9Uo=;
 h=From:To:Subject:Date:Reply-To:From;
 b=Eircr6Tft3dFFirl36Dcb7jolCSHSEKqTMiC26szRkyC4D2zNtktLr4cGedrF6YJ1
 LaxK+SiQseT+jMcaVYR1IzaJl2qRUvqVwhQfl3jHjT7DXduG/0z6L45/VKiGpzLFPT
 E8JKdW4eHVh4NhX8gdBf28Pjxr3USWs0nvbs2hxY=
X-Mailru-Internal-From: karasev@ispras.ru
From: =?UTF-8?B?0JDRgNGC0LXQvNC40Lkg0JrQsNGA0LDRgdC10LI=?= <karasev@ispras.ru>
To: =?UTF-8?B?SmFyb3NsYXYgS3lzZWxh?= <perex@perex.cz>,
 =?UTF-8?B?VGFrYXNoaSBJd2Fp?= <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: =?UTF-8?B?QUxTQTogZW11eDogQXZvaWQgcG90ZW50aWFsIGFycmF5IG91dC1vZi1ib3Vu?=
 =?UTF-8?B?ZCBpbiBzbmRfZW11eF94Z19jb250cm9sKCk=?=
MIME-Version: 1.0
X-Mailer: Mail.Ru Mailer 1.0
X-SenderField-Remind: 0
Date: Fri, 03 Feb 2023 09:00:24 +0300
X-Letter-Fingerprint: PBKA47w6O2FgxwtutgJeXvE0klLddxnX
X-Priority: 3 (Normal)
Message-ID: <1675404024.959949439@f378.i.mail.ru>
Authentication-Results: f378.i.mail.ru; auth=pass smtp.auth=karasev@ispras.ru
 smtp.mailfrom=karasev@ispras.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 119C1F4DF6A9251C6AB2A528814700E2729676C1DB439319B5A2EA8CBC22EBE48FD872164937FA4CE165BD22B9840833D1F88B251B1B9F9F0A7F00D84CA7DEA1AE2640FBC473E57A
X-7FA49CB5: 70AAF3C13DB7016878DA827A17800CE7F40B96273F7677C5D82A6BABE6F325ACACBFF42033827DA7BCF491FFA38154B613377AFFFEAFD2691661749BA6B97735F10A50E66C9A7FE8C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE70186A8DAAA7CBDB1EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CEF194B447BF7D603C12BE7C48C5BD948A20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0CB629EEF1311BF91D2E47CDBA5A96583C09775C1D3CA48CF32941D3B652364A4117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7C3CCBE1D6E78D5209FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FEFD71626BF73E38AA91E23F1B6B78B78B5C8C57E37DE458BEDA766A37F9254B7
X-87b9d050: 1
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3454548929AF40B428BA6A17336536F7ACAFFC0B907F3A2D1D59E8912AE23519A40DBC2635FA5CAD411D7E09C32AA3244C9B99F47BBCBA571E65413F651CEC86B655E75C8D0ED9F6EE83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u8Y3PrTqANeitKFiSd6Yd7yPpbiiZ/d5BsxIjK0jGQgCHUM3Ry2Lt2G3MDkMauH3h0dBdQGj+BB/iPzQYh7XS3xyn40EmMxrmzGyQ9/nTnF2gqhJpzW7Supf1Wbpd8t+6
X-Mailru-Internal-Auth: pass
X-Mailru-MI: 800
X-Mailru-Sender: 9157818B597D6E100B886F01C9EF4C22B8A30311058FC3480808DCC94A0B1288EB12F93948676A7606CD02445D2D9C8FFBE401D834700D680CFC6031913B841D077807B0FB94DC2198D56EB411B7666E3DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Spam: undefined
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Reply-To: =?UTF-8?B?0JDRgNGC0LXQvNC40Lkg0JrQsNGA0LDRgdC10LI=?=
 <karasev@ispras.ru>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CkluIHNuZF9lbXV4X2NvbnRyb2woKSBtZXRob2QgInNuZF9lbXV4X3BvcnQiIGNhbiBiZSBwYXNz
ZWQgd2l0aMKgCmZpZWxkIGNoc2V0Lm1pZGlfbW9kZSA9PSBTTkRSVl9NSURJX01PREVfWEcuIFRo
ZSAidHlwZSIgY2FuIGJlwqAKTUlESV9DVExfUElUQ0hCRU5EIG9yIE1JRElfQ1RMX0NIQU5fUFJF
U1NVUkUuCkl0IG1heSBsZWFkIHRvIGFjY2Vzc2luZyAnY29udHJvbCcgYXJyYXkgb2Ygc2l6ZSAx
Mjggd2l0aMKgCk1JRElfQ1RMX1BJVENIQkVORCAoMHg4MCkgb3IgTUlESV9DVExfQ0hBTl9QUkVT
U1VSRSAoMHg4MikgaW5kZXguCsKgCkhvdyBjYW4gd2UgcHJldmVudCB0aGlzPyBXb3VsZCBpdCBi
ZSBhIGdvb2Qgc29sdXRpb24gdG8gcGxhY2UgY29kZSBsaWtlIHRoaXPCoApiZWZvcmUgY2FsbCBz
bmRfZW11eF94Z19jb250cm9sKCk/CsKgCmlmICh0eXBlID09IE1JRElfQ1RMX1BJVENIQkVORCB8
fCB0eXBlID09IE1JRElfQ1RMX0NIQU5fUFJFU1NVUkUpewrCoMKgIMKgcmV0dXJuOwp9CsKgCkZv
dW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGgg
U1ZBQ0Uu
