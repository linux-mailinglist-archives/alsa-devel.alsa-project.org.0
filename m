Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF81A3D0246
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 21:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 165151691;
	Tue, 20 Jul 2021 21:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 165151691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626810470;
	bh=alB2sxiKar7Iik0Ybwp098P+KdOlAkCEz7/h8nyUllQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VzwQD6RevvY+EWjW8vTVzQRdYl168hegcpvYm+E9ysuUdAos+mEbUrut1igeoj5w8
	 8ecXSoXm+zvkUGxVMzpon1wHDXcuV6u5eHQqvBLaM1NRJXob0Jrij+50kD8J8ef7fD
	 7/r3Fbn6eAySO9Sgblq4im4vNE3HW3mrs20zGO3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC7FF80423;
	Tue, 20 Jul 2021 21:46:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7E70F8032B; Tue, 20 Jul 2021 21:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96B0AF800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 21:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96B0AF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VqLrbabm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 546D46100C;
 Tue, 20 Jul 2021 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626810409;
 bh=alB2sxiKar7Iik0Ybwp098P+KdOlAkCEz7/h8nyUllQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VqLrbabmJjaFYMqDcp6bM9cMXEvEUXGqlYn6ZDGOEGu3/+Gk9OZ2SyJtw/z9u9IW9
 c+zvfuMBra6iakD2bwNJDsFsYD9Mz5PY7EXz5ZVTeq8obepblYuOT0vvAIzgP1s2sG
 0a96x/H5rhyM5WQZ9JB54f33Y3EByvHrisyPM6XWSCrfDPaKe/21PN1bn2KWGl9wgj
 JFdJPI9+mrbAiK7U10ZyMMIlv14Owppo8Bn9jZeqD9D/Ac2+mW8/vUbs2rvCAExao8
 x94S+KltPu6+R28sPFO4ugrgLNm17Lb7Um0TUGY24nsh/T+rSNsr311uT1ddUiBJus
 TSWw08qw+R25w==
Date: Tue, 20 Jul 2021 12:46:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 14/79] ALSA: cs4281: Allocate resources with
 device-managed APIs
Message-ID: <YPcoJ3dkoEkc4xtP@Ryzen-9-3900X.localdomain>
References: <20210715075941.23332-1-tiwai@suse.de>
 <20210715075941.23332-15-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715075941.23332-15-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
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

On Thu, Jul 15, 2021 at 09:58:36AM +0200, Takashi Iwai wrote:
> This patch converts the resource management in PCI cs4281 driver with
> devres as a clean up.  Each manual resource management is converted
> with the corresponding devres helper, and the card object release is
> managed now via card->private_free instead of a lowlevel snd_device.
> 
> This should give no user-visible functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/cs4281.c | 112 ++++++++++-----------------------------------
>  1 file changed, 24 insertions(+), 88 deletions(-)
> 
> diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
> index e122a168c148..f338caf98354 100644
> --- a/sound/pci/cs4281.c
> +++ b/sound/pci/cs4281.c
> @@ -1268,8 +1268,10 @@ static inline int snd_cs4281_create_gameport(struct cs4281 *chip) { return -ENOS
>  static inline void snd_cs4281_free_gameport(struct cs4281 *chip) { }
>  #endif /* IS_REACHABLE(CONFIG_GAMEPORT) */
>  
> -static int snd_cs4281_free(struct cs4281 *chip)
> +static void snd_cs4281_free(struct snd_card *card)
>  {
> +	struct cs4281 *chip = card->private_data;
> +
>  	snd_cs4281_free_gameport(chip);
>  
>  	/* Mask interrupts */
> @@ -1278,49 +1280,20 @@ static int snd_cs4281_free(struct cs4281 *chip)
>  	snd_cs4281_pokeBA0(chip, BA0_CLKCR1, 0);
>  	/* Sound System Power Management - Turn Everything OFF */
>  	snd_cs4281_pokeBA0(chip, BA0_SSPM, 0);
> -	/* PCI interface - D3 state */
> -	pci_set_power_state(chip->pci, PCI_D3hot);
> -
> -	if (chip->irq >= 0)
> -		free_irq(chip->irq, chip);
> -	iounmap(chip->ba0);
> -	iounmap(chip->ba1);
> -	pci_release_regions(chip->pci);
> -	pci_disable_device(chip->pci);
> -
> -	kfree(chip);
> -	return 0;
> -}
> -
> -static int snd_cs4281_dev_free(struct snd_device *device)
> -{
> -	struct cs4281 *chip = device->device_data;
> -	return snd_cs4281_free(chip);
>  }
>  
>  static int snd_cs4281_chip_init(struct cs4281 *chip); /* defined below */
>  
>  static int snd_cs4281_create(struct snd_card *card,
>  			     struct pci_dev *pci,
> -			     struct cs4281 **rchip,
>  			     int dual_codec)
>  {
>  	struct cs4281 *chip;
> -	unsigned int tmp;
>  	int err;
> -	static const struct snd_device_ops ops = {
> -		.dev_free =	snd_cs4281_dev_free,
> -	};
>  
> -	*rchip = NULL;
> -	err = pci_enable_device(pci);
> +	err = pcim_enable_device(pci);
>  	if (err < 0)
>  		return err;
> -	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
> -	if (chip == NULL) {
> -		pci_disable_device(pci);
> -		return -ENOMEM;
> -	}
>  	spin_lock_init(&chip->reg_lock);
>  	chip->card = card;

clang warns:

sound/pci/cs4281.c:1298:2: error: variable 'chip' is uninitialized when used here [-Werror,-Wuninitialized]
        chip->card = card;
        ^~~~
sound/pci/cs4281.c:1291:21: note: initialize the variable 'chip' to silence this warning
        struct cs4281 *chip;
                           ^
                            = NULL
1 error generated.

>  	chip->pci = pci;
> @@ -1332,46 +1305,29 @@ static int snd_cs4281_create(struct snd_card *card,
>  	}
>  	chip->dual_codec = dual_codec;
>  
> -	err = pci_request_regions(pci, "CS4281");
> -	if (err < 0) {
> -		kfree(chip);
> -		pci_disable_device(pci);
> +	err = pcim_iomap_regions(pci, 0x03, "CS4281"); /* 2 BARs */
> +	if (err < 0)
>  		return err;
> -	}
>  	chip->ba0_addr = pci_resource_start(pci, 0);
>  	chip->ba1_addr = pci_resource_start(pci, 1);
>  
> -	chip->ba0 = pci_ioremap_bar(pci, 0);
> -	chip->ba1 = pci_ioremap_bar(pci, 1);
> -	if (!chip->ba0 || !chip->ba1) {
> -		snd_cs4281_free(chip);
> -		return -ENOMEM;
> -	}
> +	chip->ba0 = pcim_iomap_table(pci)[0];
> +	chip->ba1 = pcim_iomap_table(pci)[1];
>  	
> -	if (request_irq(pci->irq, snd_cs4281_interrupt, IRQF_SHARED,
> -			KBUILD_MODNAME, chip)) {
> +	if (devm_request_irq(&pci->dev, pci->irq, snd_cs4281_interrupt,
> +			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
>  		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
> -		snd_cs4281_free(chip);
>  		return -ENOMEM;
>  	}
>  	chip->irq = pci->irq;
>  	card->sync_irq = chip->irq;
> +	card->private_free = snd_cs4281_free;
>  
> -	tmp = snd_cs4281_chip_init(chip);
> -	if (tmp) {
> -		snd_cs4281_free(chip);
> -		return tmp;
> -	}
> -
> -	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
> -	if (err < 0) {
> -		snd_cs4281_free(chip);
> +	err = snd_cs4281_chip_init(chip);
> +	if (err)
>  		return err;
> -	}
>  
>  	snd_cs4281_proc_init(chip);
> -
> -	*rchip = chip;
>  	return 0;
>  }
>  
> @@ -1887,46 +1843,34 @@ static int snd_cs4281_probe(struct pci_dev *pci,
>  		return -ENOENT;
>  	}
>  
> -	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
> -			   0, &card);
> +	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
> +				sizeof(*chip), &card);
>  	if (err < 0)
>  		return err;
> +	chip = card->private_data;
>  
> -	err = snd_cs4281_create(card, pci, &chip, dual_codec[dev]);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	err = snd_cs4281_create(card, pci, dual_codec[dev]);
> +	if (err < 0)
>  		return err;
> -	}
> -	card->private_data = chip;
>  
>  	err = snd_cs4281_mixer(chip);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	if (err < 0)
>  		return err;
> -	}
>  	err = snd_cs4281_pcm(chip, 0);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	if (err < 0)
>  		return err;
> -	}
>  	err = snd_cs4281_midi(chip, 0);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	if (err < 0)
>  		return err;
> -	}
>  	err = snd_opl3_new(card, OPL3_HW_OPL3_CS4281, &opl3);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	if (err < 0)
>  		return err;
> -	}
>  	opl3->private_data = chip;
>  	opl3->command = snd_cs4281_opl3_command;
>  	snd_opl3_init(opl3);
>  	err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	if (err < 0)
>  		return err;
> -	}
>  	snd_cs4281_create_gameport(chip);
>  	strcpy(card->driver, "CS4281");
>  	strcpy(card->shortname, "Cirrus Logic CS4281");
> @@ -1936,21 +1880,14 @@ static int snd_cs4281_probe(struct pci_dev *pci,
>  		chip->irq);
>  
>  	err = snd_card_register(card);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	if (err < 0)
>  		return err;
> -	}
>  
>  	pci_set_drvdata(pci, card);
>  	dev++;
>  	return 0;
>  }
>  
> -static void snd_cs4281_remove(struct pci_dev *pci)
> -{
> -	snd_card_free(pci_get_drvdata(pci));
> -}
> -
>  /*
>   * Power Management
>   */
> @@ -2054,7 +1991,6 @@ static struct pci_driver cs4281_driver = {
>  	.name = KBUILD_MODNAME,
>  	.id_table = snd_cs4281_ids,
>  	.probe = snd_cs4281_probe,
> -	.remove = snd_cs4281_remove,
>  	.driver = {
>  		.pm = CS4281_PM_OPS,
>  	},
> -- 
> 2.26.2
