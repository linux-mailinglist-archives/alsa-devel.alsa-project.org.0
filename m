Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8342433B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:46:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D6E3E;
	Wed,  6 Oct 2021 18:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D6E3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633538781;
	bh=NfS0vttCJGd33n/vq5EkCQ578MsXXvDqrcIn4doOym0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYweXzIbD/djzgep7bpCNn4cBEL9wXWlXAklXW7kOtM+ZVoNyDtQIx1FjDRLSM7+D
	 91Y8yntX2nmnVF4almK55c+i/0aBFIIJYe5mPP7sfgnjpStBZiYpYKFjfFEG0O+WHk
	 /JdXEDeFNpD1fgMQ74fWcx6DTU0S1i22uvvRMtqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F3BEF80229;
	Wed,  6 Oct 2021 18:45:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D1C2F80240; Wed,  6 Oct 2021 18:45:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD37FF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD37FF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FDOKYzBH"
Received: by mail-ed1-x534.google.com with SMTP id g10so11847478edj.1
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 09:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFQMXs1FWPKk+z75/Ibi8RBzSAlftzRuPEJSYjyeDu4=;
 b=FDOKYzBHp2YLiUnq0WZzabgTe9i5xIyf6ubwzBz+kgq6TEeU/qqgr7WWwWkUWQ3X81
 evQweXnGrt7ioSV+PwoHEZSn1abm7RRYY6w/vTOIbpXtYQljeG3A9IQ7dAhWF4eIjoi8
 q4wL8D8uxzXG6yttYcpJRL4/N3DLaPrSjqHrNZi76LEYbwNt59gYKJtfJvtDKLgmT0eC
 HDrPuCW29bg6bz9ZjZje5rBor7i3iuvfMcHMaNWzBOCaDEPKqa2xLzlfokayRt+/e8Oy
 c7pPNY8MKrMZKNwHGYpog3vygs3H1YV2J8+INV4sksZVVM4Uw2CVf1CO4Su5Abv+P3BL
 dGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFQMXs1FWPKk+z75/Ibi8RBzSAlftzRuPEJSYjyeDu4=;
 b=vkQYkhlgZiGD9rl6bO8AqQk6jZA64sdXNucjgGxY08xevILyzAVP1aKbGaN8BzJEfk
 wMaYUNqsfNRBS4Co+WUo7zihALbdwP+U2iHbQ/Engt69y6p9fVttMbWpgM1DMQjTiRdg
 3I6uE1/Bgy5sNfDq9Jtol+mwYyTREJSWQBzzdhbB1JVBwY6kNd4C/GO/duQj/huursbV
 6g49LYKUyavTYuytV7myEB5/lnmuF2WYooCeHMJ+svd26ibOdMuprPUpjjZt4iSZwS4F
 Gy+6106jxIyi3NovdTYl6KJ+RMNNtldGwFr44q/6RHsAh19PWz+F7AvvrCaNKSKgpu4R
 xing==
X-Gm-Message-State: AOAM532Ml6x5uob//5irepu/hPE9wE93t9ZgtDQs2fiMPOM5OB1tNhYu
 Lfs2oQywMZS3Gr5PA2rsP6C47mVMNJTHPbS6n24=
X-Google-Smtp-Source: ABdhPJwD4HF5So+87RVcKvG1inKX9QQaCQjFQsCnXZmNoednB3t49TlMcWePXYfJvAkmQSFWY0ZPHz2JwQG3BQiPOfo=
X-Received: by 2002:a05:6402:143b:: with SMTP id
 c27mr36480125edx.224.1633538690336; 
 Wed, 06 Oct 2021 09:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-2-brent.lu@intel.com>
In-Reply-To: <20211006161805.938950-2-brent.lu@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 6 Oct 2021 19:44:13 +0300
Message-ID: <CAHp75Vf5xtqpJV6LZZDLwz0LRQVShyPrfsj9kSDrgh_0k_qMcA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: soc-acpi: add alternative id field for machine
 driver matching
To: Brent Lu <brent.lu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Rander Wang <rander.wang@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 Gongjun Song <gongjun.song@intel.com>, Bard Liao <bard.liao@intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Libin Yang <libin.yang@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>
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

On Wed, Oct 6, 2021 at 7:21 PM Brent Lu <brent.lu@intel.com> wrote:
>
> Current design to support second headphone driver in the same machine
> driver is to duplicate the entries in snd_soc_acpi_mach array and
> board configs in machine driver. We can avoid this by adding an id_alt
> field in snd_soc_acpi_mach structure to specify alternative ACPI HIDs
> for machine driver enumeration and leave the codec type detection to
> machine driver if necessary.

...

> +static bool snd_soc_acpi_id_present(struct snd_soc_acpi_mach *machine)
> +{
> +       struct snd_soc_acpi_codecs *id_alt = machine->id_alt;
> +       int i;
> +
> +       if (acpi_dev_present(machine->id, NULL, -1))
> +               return true;
> +
> +       if (id_alt == NULL)
> +               return false;
> +
> +       for (i = 0; i < id_alt->num_codecs; i++) {
> +               if (acpi_dev_present(id_alt->codecs[i], NULL, -1))
> +                       return true;
> +       }
> +
> +       return false;
> +}

Wondering if you may modify data structure in a way that makes it
possible to use for_each_acpi_dev_match().

...

> +               if (snd_soc_acpi_id_present(mach) != false) {

' != fase' is redundant.



-- 
With Best Regards,
Andy Shevchenko
