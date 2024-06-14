Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DC908DA0
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 16:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C5F3DFA;
	Fri, 14 Jun 2024 16:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C5F3DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718375986;
	bh=lUeuZLDhmpyyS4f0MIrdJjz8fD3Df+EhU3vc+pERsg4=;
	h=Date:To:References:Subject:From:Cc:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mX7gKFoL6AXdzSzEvgXS4Vq6xiAEcDDM4t05qU8NTPol1GOWIkVXYiOpMoa0/z2VY
	 QxwNGc9hFnFa9jzb3j48S2l3/Zc5+5jFptkMdqUOSoQ/2/zpLI4CaywgNX6g1tcxs1
	 vuaKH3GH5b2brPqeWoQUaADxYnb8xhI+uTvLqr34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBB1AF8057A; Fri, 14 Jun 2024 16:39:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A25FF805A8;
	Fri, 14 Jun 2024 16:39:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D08C3F80448; Fri, 14 Jun 2024 16:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4AC8F800ED
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 16:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4AC8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=WXq4QZfU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718375931; x=1718980731; i=markus.elfring@web.de;
	bh=AEtKBfuc+IL5r/Y6qe+maU6mV02qT4mUdEokeX/0S1I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:References:
	 Subject:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WXq4QZfUW0pZzw3ikX0FiLgUpVB4tMEXJlfI1/7MWZQ3zyN4BX0ahTU+VazGTDzN
	 Su0tNDWK2PJnAoI8KjeO8AOsJm1ZutQxPMcrZLf3+2xnIbmy5uswSb9A44cGJ2UOW
	 mCek2PMxKbnNhb18FXF0H9hdqt6rM7hKWr4fxJRR0P0jn6aFZcsSleSV9T0cSOtI6
	 00M+seW4cVmYbe+yRRfiAnsVubsUCxwE0bwaef4tqEAQ43+85ZgysdIq3x0Z0vJ87
	 7iB8SZcbY+d9Hs9Jvuh7T4sOMKBz+Y8iKIpg1ptD5rR7PFsHd59E45cAKkGSH3uHq
	 MYSXUb0pdeqQtmhSrA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Ml46w-1sfP432srE-00ekon; Fri, 14
 Jun 2024 16:38:51 +0200
Message-ID: <942b8957-03ce-4dc1-9b90-880b2d3b4c8b@web.de>
Date: Fri, 14 Jun 2024 16:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baojun Xu <baojun.xu@ti.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Shenghao Ding <shenghao-ding@ti.com>
References: <20240614040554.610-1-baojun.xu@ti.com>
Subject: Re: [PATCH v8] ALSA: hda/tas2781: Add tas2781 hda SPI driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Gergo Koteles <soyer@irl.hu>,
 Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mukund Navada Kanyana <navada@ti.com>, niranjan.hy@ti.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Shenghao Ding <13916275206@139.com>,
 v-hampiholi@ti.com, Vijeth P O <v-po@ti.com>
In-Reply-To: <20240614040554.610-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CKa+cQQigXWpfS6uENP7iy5YriDsbzCT0EYWzNJFoMUPvF5PVST
 XVCs7Y4rw7PWcdqEoJJSvThIg6m3gXxqii+cWyHTBiiWidfiup/bs+jNAOWXqrsg1sH2BlP
 hT3NzMvyUjSkCU9ZYnMv3OYOULm8i8AgHyfEEoRrCw+dW8wTpZv7WvcLr20SSzMED+IRW7s
 3mE1daIaH4fUOb8YzsqGA==
UI-OutboundReport: notjunk:1;M01:P0:dv3qCaZ2USU=;Y+vo+UdQqylJ8iguU6aDWAFQMHl
 DmQNwKlpH1BCu5Fog6niJb7XUuh4vxGt949auuyoEqAcROrhuZWzemab2GlCSa0GqYER52g4R
 Zu7sc/nSdJPS0/wZs4agxFStZZr1UC0Z97+adcRD2XAMtkeJEGzCbmK9x3o+C3kJQMcKUeGm+
 9ddkqNu1ePbwHfnjSYFu9tn4Wzm4TZpyKSlTw/gc79FrBrMpq1Hii66Zox8+6pv17nZCRpA3N
 +Yj9O5oHf49Iy/0ibq/MpvXMJvo7OEg5Zn+THRqANJfu1AkqBjmf8NpJzIM5gliFbfU0nhFfc
 YeHv1AgxqYVtaGYberBcD/7IBdO+6qT8n8Rz4ns00ymKDw7DDZMo1t6iEYWH6LKZtvs6JUnwQ
 3D/gcqKqDq2M3MLQMBABAsMTBLCA/9eYmp/UW7Nm9+dIQsbifnV+j7VG1t6vXNmJbMnXcnBIV
 pTOj5FCZlZUxH3NJNEDnthvR+eiHKFO1NvEtnwSM3p/IffwU+VfZ7jKMvTznF3K7IFrBwRfOv
 7CqKqfhzbGznmFZKyelGA5YXVrHC/M+ZanQwVbBYdTuh6bSBXLXd2dYSVOqged3JMWc2ypj5u
 s5FoOQfcIRJmBzKXo6yk+098txQfIaeKJ+YusVz4vERbfybRpvFHNvT/oLoUiWwkiiGtugCAW
 X6vWnivad/Shd0K1JhDWtjC2azOrxTMHM+I05hVX7b0c3fAZFbHyNeCPmG2fsUxt8VEtKusJX
 IRKFv4yZPJ1M2VSFMxGRQHaksTg82i4fflLlWpuLzJ5n9u0K4GA54CtrmuflQF/QbMbZgk5bc
 IDzFEmqn5OT/sZWq+hVsSiYH1GlpNswLAOuFj2ejqHae0=
Message-ID-Hash: AVR5ZW3X2FTPQISDIYOXV3AG7FEXQMUG
X-Message-ID-Hash: AVR5ZW3X2FTPQISDIYOXV3AG7FEXQMUG
X-MailFrom: Markus.Elfring@web.de
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVR5ZW3X2FTPQISDIYOXV3AG7FEXQMUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> It use ACPI node descript about parameters of TAS2781 on SPI, it like:
=E2=80=A6
> probe twice for every single SPI device. And driver will also parser
> mono DSP firmware binary and RCA binary for itself.
> The code support Realtek as the primary codec.

* Would you like to avoid typos in such a change description?

* Please improve the changelog with imperative wordings.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94


=E2=80=A6
> +++ b/sound/pci/hda/tas2781_hda_spi.c
> @@ -0,0 +1,1266 @@
=E2=80=A6
> +static int tas2781_hda_spi_probe(struct spi_device *spi)
> +{
=E2=80=A6
> +	ret =3D component_add(tas_priv->dev, &tas2781_hda_comp_ops);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "Register component failed: %d\n", ret);
> +		pm_runtime_disable(tas_priv->dev);
> +	}
> +
> +err:
> +	if (ret)
> +		tas2781_hda_remove(&spi->dev);
> +
> +	return ret;
> +}
=E2=80=A6

How do you think about to adjust the control flow another bit for this fun=
ction implementation?


=E2=80=A6
> +++ b/sound/pci/hda/tas2781_spi_fwlib.c
> @@ -0,0 +1,2101 @@
=E2=80=A6
> +static struct tasdevice_config_info *tasdevice_add_config(
> +	struct tasdevice_priv *tas_priv, unsigned char *config_data,
> +	unsigned int config_size, int *status)
> +{
=E2=80=A6
> +	return cfg_info;
> +out1:
> +	for (int j =3D 0; j < i; j++)
> +		kfree(bk_da[j]);
> +	kfree(bk_da);
> +out:
> +	kfree(cfg_info);
> +	return NULL;
> +}

* Please improve your label selection.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/coding-style.rst?h=3Dv6.10-rc3#n536

* Will development interests grow according to the application of scope-ba=
sed resource management
  also for this function implementation?
  https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.=
h#L8


Regards,
Markus
