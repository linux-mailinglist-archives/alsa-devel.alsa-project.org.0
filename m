Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6FF1F6A60
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 16:54:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 550011686;
	Thu, 11 Jun 2020 16:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 550011686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591887273;
	bh=PE4yp1VCi8YJEdoDqLis/aojzCEIrsI9rEG814rmuZ0=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txK8nR3uw69+w0kWKtoKNUIsbDa5CiPMO2FeUtBoTAjpW7VuyleqTo8pJEIRLX/+Z
	 ic+gtPqrPJ/6SIjEvQ4XyWyelRjOWHtNho6oaaY18Ywqk/fgat78rDLWvf6TCwGCi8
	 rEPVIKFM+rlw0tpHdc1BFSEfhGmbEU44G5MJ08cA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8452DF802A7;
	Thu, 11 Jun 2020 16:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81868F80292; Thu, 11 Jun 2020 16:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B21F800CC
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 16:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B21F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca
 header.b="ZuOuu6dU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1591887122; bh=KZU41mzjo8YhkM4cekdJ5/j1xc6nz7kyQqQpnnzbcmA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=ZuOuu6dUpQDDGD1eJuy1x6yzaxy4+3GGnjKcwe4ySKIW7X1UFh3DqcJwI8CDmD6f9+OEhc9qRilN8m6axjg/N8/mjYSYGqp2YT47BL3SgC+fWbMC3xY1J1uosrgM7XC2LL2uLa10cSuiZCFwW/xw2LA+K6tDZXRIT6q6qwAdxao4WUZTmNa5HVwWY1js/blPfFPGTI3KEiDK+TEXh1DJavJ3KDVStPDIm9NBOXUPEFca6b0OSUMNI3dVYcBojpWkyJ4Y5R8Y31REZYKonw6HsGvWkaHRrjMEiEP0qMT9jot5XYLvh/mTxw7FdQc1y3C9qovIpRNaCoIfOJAQpJlfVg==
X-YMail-OSG: D_RezpgVM1kBJKU4ltGuI9yc3kvCcDxIanMilqIDEkDmr39qh6mGQZWYR.AngMt
 PSwfxTPrYoBF_nfX36oVMWVuYiyILG0kTloVnBdLuY_1amPJWN8oIMXsoaiIf0dZam7wDkSoNLrm
 yyiTHH_DJDpyQA3DUN2aEVZqJ8qqf8P0DDCTAuVUhYWHEQ0Vo9pfCXbmq2jU9RsV7b9_lSc66WtC
 K2adlOfSGaa0X6AyxL7aYuX9ItmScfT1wKecDTF9.vVitykqDsKwIW.xihUEz9D1NekAqGUNpEN6
 ebohSnxSLXa.iC0VjczSIS.tQowTny8_BojzZ1aECPwR1muYkZ2HbfDMcW8P4Sms3BH4XWH8sOug
 HhBjb4fHcGpj6hBHJp5ofnVqwDRr94HLwPw_bbV7rcOiXLefg7Tx3lEwk.arStYu.ZkguRZhdEUB
 rxPMmI1.jboAulkng.6ikMlajyDhBxb24bePIVA9MoVxXsBe0mcpVMify0ADXCj7y5SKDnuDqoul
 r2Z.UgYLSV.QDFDiolv4Z7afoRnhMxipfb7fjzNTPkycayhVf4S8WHkHyKQCUhap1uJU409chVSD
 hYc8AWxSp71pZFiZ7Hedwwegg36nd4wCw_f.dbQJSPGk_luOmAA7nZFEn3G5VOAhzg57F.vZ7J99
 c1LOwIW63cp2nQrnbK99VliGPgyh5G58FzmPHLu2LOWJ3sEtrhCJNAPWMN4K2oc8WTZOEXVgj7Rh
 vpTCYhhpWqNTFf1bvwD9ux_uNJ5aGw7ib5q3ARHd1dPKbh7cSxoKZ_UzgAUX.U7jzODouZlrKlUu
 0j14MnwvSQZnXY9.0toSE4vt1reYw5U4OGnU2pwEiby6e2CgNzhwAsUq.xs5LLKOgsB8sO00F2n.
 wTmvUCm92m1TtBJ59lCGJ8abJSU2UiS9rTmyOdJ5QDlxxABxBNJOeqLiq4E21iPCRkVYOBRUbTCH
 YhoPd5eeB25UY3gKIQsi.PC5ZiGBpzBB7Nz_A17nBOlp_g9_lVuzOxJVxd9X3ttsw4twPcBR0MNp
 mQ11D.var4bz4SC0qhtIs3SxgVo36CYS7UrMtknBDYgMc9Cmz11tpzW_8IUrXQ1Di.bdibSLrUNl
 tjpczYgtQp3ADNNdFaeSdvipqMtvPL0mqANHu2qxdcHq8zU_Qoo5.jJFcvXHELlX5C0EmRYvPsaU
 _TAjOW6p.ith4GQ.8ANBDGiHdfD_OKX6PxiRH9JeNDpWzdiPW6fEo_bT4QJvPr5RKqhK6QtUp822
 X027OExABVatvCz.rVEQQUaBpjHpWW2KZPKrXdVMRcVfH.Rqu7Qce4vYjtHFW37hL46CxGFIwQsF
 .PEy15ES3flyyEt2C6HwqTbKvG035Wl4F60QTM406KGP5vJBUqy_n1G156Yo.dxl7Xp4TcHlCXB8
 FSid8v7NTs1uoYZmgvQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Thu, 11 Jun 2020 14:52:02 +0000
Received: by smtp431.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 6c780120874f2799e5b2cd41953912c9; 
 Thu, 11 Jun 2020 14:51:59 +0000 (UTC)
Date: Thu, 11 Jun 2020 10:51:55 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
To: Takashi Iwai <tiwai@suse.de>
References: <20200520111136.GA3802@amd>
 <1591545088.74ii116nf2.none@localhost> <20200608061950.GA17476@lst.de>
 <1591624340.z01ejtod28.none@localhost> <20200609114733.GA1621@lst.de>
 <s5hr1uogtna.wl-tiwai@suse.de>
In-Reply-To: <<s5hr1uogtna.wl-tiwai@suse.de>
MIME-Version: 1.0
Message-Id: <1591885264.uk6f214o4o.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, rientjes@google.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com,
 tglx@linutronix.de, Christoph Hellwig <hch@lst.de>
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

Excerpts from Takashi Iwai's message of June 9, 2020 11:12 am:
> On Tue, 09 Jun 2020 13:47:33 +0200,
> Christoph Hellwig wrote:
>>=20
>> Alex, can you try this patch?
>=20
> Also could you check whether just papering over the memset() call
> alone avoids the crash like below?  For PulseAudio and dmix/dsnoop,
> it's the only code path that accesses the vmapped buffer, I believe.
>=20
> If this works more or less, I'll cook a more comprehensive fix.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -754,9 +754,11 @@ static int snd_pcm_hw_params(struct snd_pcm_substrea=
m *substream,
>  	while (runtime->boundary * 2 <=3D LONG_MAX - runtime->buffer_size)
>  		runtime->boundary *=3D 2;
> =20
> +#if 0
>  	/* clear the buffer for avoiding possible kernel info leaks */
>  	if (runtime->dma_area && !substream->ops->copy_user)
>  		memset(runtime->dma_area, 0, runtime->dma_bytes);
> +#endif
> =20
>  	snd_pcm_timer_resolution_change(substream);
>  	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
>=20

Sorry, this patch doesn't work for me with SME off using abfbb29297c2.=20
David's newest submitted patch works for me, which I already replied to=20
separately.

Thanks,
Alex.
