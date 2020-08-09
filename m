Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A9F23FFBA
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Aug 2020 20:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5833A1663;
	Sun,  9 Aug 2020 20:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5833A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596998717;
	bh=R+0dZpbW0XgFc4J0RgpGDwj2W4jMI5e8jGUGNW6Nhzw=;
	h=To:Subject:From:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mUtSGz0/Pppv8cWim+EZhjZ6a8gMe+ED/M7lRkCNMgW4h70/2DhOtxlte5w1qEtN+
	 Och01iQS78C87EuCYYAfEVpALKmUnLjokJTqWAtyiIKD09P1uWOVPRgsC+dBjhUUy6
	 tDzRkH09RxDICC+QD6DlIkYhcnXafXP0d6L/mnKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E478F80139;
	Sun,  9 Aug 2020 20:43:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE04FF8015B; Sun,  9 Aug 2020 20:43:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05BBDF800BC
 for <alsa-devel@alsa-project.org>; Sun,  9 Aug 2020 20:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BBDF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="bdCKQM6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1596998582;
 bh=R+0dZpbW0XgFc4J0RgpGDwj2W4jMI5e8jGUGNW6Nhzw=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=bdCKQM6ryjpzsnXfYMdYIbPeWDX8DZ+3pMrwtLKBkb4kSl6ZWTQSy68C97dnLerWY
 2fbdAPOPDFVxrGv4g80PVH5rnYIxIY5D9JHA7BZRoxjQEr2XN55pz821gWznDeoSl7
 TggOb75DmcKw33vfITGlkYrBh7c4sSZ7YeC40bXQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.136.16]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3m9J-1k5fEL2rHX-000mkd; Sun, 09
 Aug 2020 20:43:02 +0200
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: intel: Fix memory leak in sst_media_open()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <8b4e54fc-5548-00bd-98b2-0650439b040d@web.de>
Date: Sun, 9 Aug 2020 20:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jM64UBAu4Y3hsAlGJYWV6HcDEJQeqWabGgoaaJ/EnW5pShkIB7w
 Y1t6INq+hDdvLEGM8WkwSs9Mq1tQn8t2dIpo2CGtAhefiw9PO70pHx82cI+b5mCpFeFcuER
 WC4vKZUAimk/AchIFhgNou/RN5sFLkO9Np4zOhWA9gJtiay2n99oRr+2QWrs0E6EFAt15JD
 tf53p6jiQI4c4DO2UrYSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mN+2MXX7s8E=:/c247AX3NpcEUktnw+vwAD
 TnTFd6ALSWR1nTawpM2Ul614TYeNNhIpbimMWafrcG46qIYT1wjHRafiz+UDGffiLgINvyKZO
 2Bm4UoLJSVfy4L09ol3qr1LQe4+CAACZbTDyFq6V7Mtb+ZDvzh64pIrNXnPkSPPSzEgzaG9k/
 UvTdXlU5kmrCbZdEb/TH40M/8JjiCHjpplw5nklcH3RncFN4ZKD2H+pP2dzmAHlfWbNz/mCkF
 C5p+2skZSPbZQVjZUzveqXqQCLGaXWLPcScCb8RYOG/SqDLx3Zk+muqQouYsMpb8hurDu3Hs9
 nXOoEqEK6iUsGbqqTcrKlMLNxEZyUsoIXIdNVUXBWa1Ggt6XeICw6cDrnoog0a6S6r7mee4KK
 ZTv9Lo+Hri7ELWlrlej/JdBSF4GAd8Jqxb/SXeLCN40PYrNOtfUIQyOjEjJbwYt77PlkJI14n
 BTunufcCF/17MRfrtqzmYE3SjUGextgxB2hmypSNCN6/wHQ1NjXjKwzNW3espPTXvyslLTRvs
 YYbgiyBVw59nviNlScxbxHaWVDFMDEBAfc0F7ZP1ZfCGX4wr647XynTGl9/qlL1K4+t8GnNKg
 SScKzD7JgGx76ABeg8dIvTfhdgIEKzF+hr1rs6n4sLTY5R4o7GKqsFnZz9DaO075x5TA5nit2
 XxECyXhlotix9rj1qk7SL7XoDEGQzAuCZ/6ehY2y7lxo9bEgD2rFipPapGcn+8S9qpj4CPeFX
 1WjNhmhBTwHYjZwFZcaJUz6gYLoXoZJd+aKa9Pple0boZL8GXqzzCuJ278yWGRZyJM70lk4Vt
 T4PvoUe0EMfhTPV9Dpar3Y1BW+xYhTvTLox7WAjFfyWxaf7ZWoXscZakk5g7k+kROKypGVqXo
 1tvWORSB+gcd1kuiKlAU4yDwmvLUHTdQrFnQIBQ1rsELItq/nn2+8gjdCJYaqgmBhbyooSeWZ
 EPqCHDYlVyozZHORDt1xo395WMLtviCrPWCoul2a99iP7SnwmB7+9fyddTus2/ZCCnoscf+uO
 e48VZy+ua45Hci3TBPFX5nKrF1QONARUC2EkKVuxDVy6rLWpDKfEgD7CcFgjLE2578sxeV1BN
 MeNOnmNaDZuv/o6k8dZZrRjTEl6U0dz5T+9E1LaDYZilBgKifvbeJ/6PIZ3flP23tQmVP0wA4
 8jE13kDal1KMXQoKdQs2+LWkX6B6jqkZy/f0dFJQ/1ISRhrXleuo5cNqwkiS9Blk2LblPQda6
 kKkR37m5Ett3bpk/Pb9Ii7lpq0wcboF4i4F+mZA==
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 kernel-janitors@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>
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

> When power_up_sst() fails, stream needs to be freed
> just like when try_module_get() fails. However, current
> code is returning directly and ends up leaking memory.

Would an imperative wording be preferred for the change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3D06a81c1c7db9bd5de0bd38cd5a=
cc44bb22b99150#n151


=E2=80=A6
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -330,8 +330,10 @@  static int sst_media_open(struct snd_pcm_substream=
 *substream,
>  	runtime->private_data =3D stream;
>
>  	ret_val =3D power_up_sst(stream);
> -	if (ret_val < 0)
> +	if (ret_val < 0) {
> +		kfree(stream);
>  		return ret_val;
> +	}
=E2=80=A6

I propose to add a jump target so that a bit of common exception handling =
code
can be better reused at the end of this function implementation.

Regards,
Markus
