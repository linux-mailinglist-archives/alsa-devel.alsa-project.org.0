Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC6E89A449
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 20:39:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F992BC4;
	Fri,  5 Apr 2024 20:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F992BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712342360;
	bh=39Qv2XUUhVGjr9ia6oJF7zwuidYoxXiMel9lVaXCKsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OJR7lLrdI1jhBPAYS5ISaa76y4iPyarXOp1+arOPneC7xPAmlktRLEw41KKurfq29
	 mj3ROuXtn9eUeufOfe9UGQ9fpuhRkQrDcGgsCq5CP8KQ9z8GVr7O4cHBe4rg99zoNi
	 Arro6eI/FeVI5Se40em+13WWoeHagBdtIXCpvdh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39A3CF805A0; Fri,  5 Apr 2024 20:38:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84AD5F8059F;
	Fri,  5 Apr 2024 20:38:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3DE0F8020D; Fri,  5 Apr 2024 20:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92D56F80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 20:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D56F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=PVuPjpCo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712342303; x=1712947103;
	i=oswald.buddenhagen@gmx.de;
	bh=39Qv2XUUhVGjr9ia6oJF7zwuidYoxXiMel9lVaXCKsM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=PVuPjpCoNzrspjIi6mt6L1O8peFoLH73LrubMFiPBSWAe6sOmCQqzMzl0aC0SMdU
	 1m+r8ogh98uisQnbgo7h/uXcUZaFLTbUV3nf/VnyGMHk5du/i/lSKSR6prYQUL8Hp
	 ns2q9xvdsYqkhSuZy7LYVZgC8V/QFJkG5G0GhRZRneYBy0WlwJn8nSmznmhRRZtLv
	 VaKkrpqNNlwy3v+rQRcyvmXrSmwbNaQPU1d3UmVFwu/V33WbpLRU/Lxq5IolwYBXt
	 BLKzm15P0zluwXO3s+Q31mI2JAFUKw44baepfg9pmXD0vbfBrWptGEQeYyPsS94m9
	 hfRgWpcupVUo01S3Kg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.116]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1saSKv24Ni-00qO3v; Fri, 05
 Apr 2024 20:38:23 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsoSE-CF1-00; Fri, 05 Apr 2024 20:38:22 +0200
Date: Fri, 5 Apr 2024 20:38:22 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 00/17] ALSA: emu10k1 & emux: fixes related to
 wavetable playback
Message-ID: <ZhBFHmw/AGXvBULl@ugly>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
 <875xwwnp27.wl-tiwai@suse.de>
 <Zg/NfajQ3gdsmbUb@ugly>
 <87zfu8m7ay.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87zfu8m7ay.wl-tiwai@suse.de>
X-Provags-ID: V03:K1:5WIWqWiri0Kee1Bf+ruwVmE6JQm6rxWZpU4S8IXtsZBTjw9numu
 j5CpQAN2Fpsf+TCmrkkNelUurih+PQSMbLBQg1EaSuRfbXg/22qW91dSvzNxSY8kJG6/uoM
 5eWcaAxK8a41JPqbeASVEJeTRMCdnOfvbozEMD1hVjOAq0H2nDYP4mc38wEf/irczDNkhd6
 yhX1/sSwg9jz/oMmVioIA==
UI-OutboundReport: notjunk:1;M01:P0:VnnGpVXxISc=;T1zCzcIWM68iSa/P7x4mkWralIO
 eD7eqjFzhAEPHQALCl4WEFntNOWSYwbHK7sVIY63maYaadi1SwjJrBdxHsTMRqhhcRupuuLqJ
 f2bcwVsYG8IHXB652KEpUN4MdE4atsV1I/aih64GpGwsJ8cirJXp+ZFKgEEPFI7rQVOvszTbt
 TIKsSRpD50ffFh0New99W7+R4zsbUdgQFeO6vgegZ4aFsmqcX8+v5XLSY8fm4CkHtAo0etxmB
 1gtzkLwHrUPLKsibeA2wsVzQtOkZUgUX0k4Qz/XhtUb51NNO7Qm0RApE/98zFXQ8HrnABXGTi
 mfqMcQydIEBYTE4M5avUn6337HPDJqcs9H+NceUzpcVko/W/OXe+uZFu9nn/sDQCa+sTXggUV
 WIoz2qwoUL4YyEqJ1Nc/O92UHT42QjiEIacr0PfVSNpbLriJqkWXGs+hkFmTU/pirPfm3gaKg
 uyuxLKShtJlP/8oU4hf/KuO83CozysqsRiKnOeU+pZaG7riQbIDxCG8XSoxmAg4PDpaNY0ToY
 k7dtYzcQv2kdbeIKwFyRZgOQAmOgx83nJGHXVJQdxZGuAH+TNd4n3YT4Xip02TI/6aibkV/pw
 cdR9xetFdEpcFECwvAXAFruUXLz2m+U+7oUTelKwlTlq9raiPwNEc6MA6Y3mnwnuTRqLA9Q3Z
 7cPu+PRAE/vSJKaj3NhF1XEAeUAVFJGqxe4jJ5ajS/EvE85u0ygG2woKCRzkEw31r5kh18GgI
 sNAFcrk87KXds/aqiY7QGr7nxld8vHa23+uezjsNyrArgm3iKOn6UM+X9L/JL0qCbdXmOPi7m
 wM6Vb/MhOlTNM64IcmX0idF+c8o6Leg/NraYoZMo27VV4=
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SKVIAHLWTTMXFKTJNFPZA6L6TJDA5PMY
X-Message-ID-Hash: SKVIAHLWTTMXFKTJNFPZA6L6TJDA5PMY
X-MailFrom: oswald.buddenhagen@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 05, 2024 at 12:29:25PM +0200, Takashi Iwai wrote:
>Try by yourself to apply the submitted patch mails with git-am on the
>latest for-linus (or master) branch.
>
ok, the problem is indeed patch corruption, but it's not your fault.
trailing tabs got stripped from the patches in flight.

while my reading of
https://www.rfc-editor.org/rfc/rfc5321#section-2.3.10 is that MTAs may
not just strip trailing whitespace, the ones i tried apparently do.
somebody may want to verify that ...

anyway, you can still apply the patches by adding --ignore-whitespace to
git-am's command line.

if the process doesn't permit that, i'll re-post after convincing
git-send-email to apply quoted-printable content-transfer-encoding to
ensure preservation of trailing whitespace.

