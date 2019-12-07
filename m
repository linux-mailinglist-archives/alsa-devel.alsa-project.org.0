Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1BF115E65
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Dec 2019 21:08:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD748165F;
	Sat,  7 Dec 2019 21:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD748165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575749315;
	bh=BJDBn8Duqq3/Iq8m/mNVr4EyeS4KYh5wqyKnnzjWV2U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJXEw61gPrGWcjurTEkIECeEZkEh/nb/z92yjDSYJ8eUs2WRmwzF0cg5CcWP974nq
	 DGel4evrg8GKtMm+KFHDwbgZ3wE486NtuQ7jTDYfu3HC5s21AOzIasOckQkMjeLDlh
	 mGtyZmpt155dldRnNI3cY14Pe5V9cKMgrgtUiIE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A85EF80227;
	Sat,  7 Dec 2019 21:06:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F28EEF801F8; Sat,  7 Dec 2019 21:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_APP_ATTACH, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from tschil.ethgen.ch (tschil.ethgen.ch [5.9.7.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F417F80108
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 21:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F417F80108
Received: from [192.168.17.4] (helo=ikki.ket)
 by tschil.ethgen.ch with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <klaus@ethgen.ch>)
 id 1idgLk-0007bm-8p; Sat, 07 Dec 2019 21:06:44 +0100
Received: from klaus by ikki.ket with local (Exim 4.93-RC7)
 (envelope-from <klaus@ethgen.ch>)
 id 1idgLj-0002kT-Rf; Sat, 07 Dec 2019 21:06:43 +0100
Date: Sat, 7 Dec 2019 21:06:43 +0100
From: Klaus Ethgen <Klaus@ethgen.ch>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191207200643.GA10092@ikki.ethgen.ch>
References: <20191202184759.GB29478@ikki.ethgen.ch>
 <s5hy2vsjbm3.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hy2vsjbm3.wl-tiwai@suse.de>
OpenPGP: id=79D0B06F4E20AF1C;
 url=http://www.ethgen.ch/~klaus/79D0B06F4E20AF1C.txt; preference=signencrypt
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] CPU hook snd_hda_intel
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
Content-Type: multipart/mixed; boundary="===============7970209909118755836=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7970209909118755836==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline


--WhfpMioaduB5tiZL
Content-Type: multipart/mixed; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi Takashi,

Am Mi den  4. Dez 2019 um 17:31 schrieb Takashi Iwai:
> I guess checking the perf output would give you more clue, e.g. which
> function is hogging the CPU.  Without such information, it's very hard
> to diagnose...

No problem, I just had the problem today again.

Find attached the perf output of the relevant event handler.

Regards
   Klaus
-- 
Klaus Ethgen                                       http://www.ethgen.ch/
pub  4096R/4E20AF1C 2011-05-16            Klaus Ethgen <Klaus@Ethgen.ch>
Fingerprint: 85D4 CA42 952C 949B 1753  62B3 79D0 B06F 4E20 AF1C

--gBBFr7Ir9EOA20Yy
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="perf-output.bz2"
Content-Transfer-Encoding: base64

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

--gBBFr7Ir9EOA20Yy--

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Charset: ISO-8859-1

iQGzBAABCgAdFiEEMWF28vh4/UMJJLQEpnwKsYAZ9qwFAl3sBk4ACgkQpnwKsYAZ
9qxisAwAiMM9VMLrFBC695n1wfddZ1GChH55VrG1ifxyf4zQmQqX5xhjCHKmkqXx
iR4Klvmsvi3LwJEjey7+7P4xOWDbKjlXrVGUcfxM3qS45KWiesIVjDkchREw1NCZ
ygm7OuNR39z3D3QtpTNAYBCHMxKxLc/x380iQfugLofIILj09w1AztKkqeNN0gKX
NgiC6ErdFy6LJjRG3iZoqma7AP4jcEOG1wEEIcWC2xdEGFjDLzDYiimJUIe7sTHG
Zc76SjZEokG1+idAwb0/HPHrhgkvNpVsxVsjo+3uNnbUkXxqyoCZW1U7KRSP42Av
YDigwh1fUoESNTuSulBGdsCmKQaYCSX7+Mec9FkI5mB8H1K71G+FDvy6+H/zZr/6
+aVaICcKi4NrqJc6g6dS/I7JgFuzH3VrLtanNKVMJCaUMUVvCFLUgRg3GfoG9fux
TZjc/KO967e9D98Uh9UyaIh4DWmx0ECWWWAlvf1/wGSx8Pc/Dl6h3Klma6NnUGBb
FaRW7RVr
=zC+q
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--

--===============7970209909118755836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7970209909118755836==--
