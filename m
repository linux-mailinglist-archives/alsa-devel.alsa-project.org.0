Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301023D0244
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 21:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5A7C168E;
	Tue, 20 Jul 2021 21:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5A7C168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626810417;
	bh=gNHNAsSX0w3EdOpORCqSy6Y2xT7Y8IHmvcetiX5FN4I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrWQ3PMpMQNBmRKTnl0kHBivIsJsXDZPF3ZmCyS7D6D/9ZbwwOGy4XAXN797pIvO1
	 qudcshuPEALBPa0ajU92UHCK4HAIq+ZQfqCfZ/wS2LtNvu7Dv268yi/dS6v7NnK/D+
	 KZhDr4wCJFLN5ziHhVArYeXVkFAH3bvZ9cWYvQrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4215CF80104;
	Tue, 20 Jul 2021 21:45:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 384B1F80104; Tue, 20 Jul 2021 21:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9F80F800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 21:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9F80F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jKeODBak"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D494E610D2;
 Tue, 20 Jul 2021 19:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626810320;
 bh=gNHNAsSX0w3EdOpORCqSy6Y2xT7Y8IHmvcetiX5FN4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKeODBakOS9Wd5S69A4cigwTqtvq6TvOVARg+OALalJyHF2jjDhT9lNk69WiRsVTR
 s2M0+zjH2gUuATs9E6RqAD3pA3yMMaZfdWtrFvKj5sIvbh3kLT1/euUGOHloEUb3Vk
 cYvl1SLO1W+G8XfBFkjrIpAMkaZQR8QyiiGEVllrWsAZJ1C1KdAN6U/Ne9xc3jaSwk
 KqVI8SN4I2FsEUItpunuw+hBTv5jGLMZhO7rWLoWHFXcW/ATDJF9ff94nz1ZjeQAYX
 3CnUi58R8aM5nzkR+PGoyC0ntnlGDpq+ZxSPoHwHYQkaR8+JPo2a1ZVdIKxj19A3FT
 UIQkmIOIegeMQ==
Date: Tue, 20 Jul 2021 12:45:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 09/79] ALSA: als300: Allocate resources with
 device-managed APIs
Message-ID: <YPcnzVns1kz7wtxd@Ryzen-9-3900X.localdomain>
References: <20210715075941.23332-1-tiwai@suse.de>
 <20210715075941.23332-10-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715075941.23332-10-tiwai@suse.de>
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

On Thu, Jul 15, 2021 at 09:58:31AM +0200, Takashi Iwai wrote:
> This patch converts the resource management in PCI als300 driver with
> devres as a clean up.  Each manual resource management is converted
> with the corresponding devres helper, and the card object release is
> managed now via card->private_free instead of a lowlevel snd_device.
> 
> This should give no user-visible functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/als300.c | 79 ++++++++++------------------------------------
>  1 file changed, 17 insertions(+), 62 deletions(-)
> 
> diff --git a/sound/pci/als300.c b/sound/pci/als300.c
> index 668008fc21f7..9c94072572a5 100644
> --- a/sound/pci/als300.c
> +++ b/sound/pci/als300.c
> @@ -163,21 +163,11 @@ static void snd_als300_set_irq_flag(struct snd_als300 *chip, int cmd)
>  	snd_als300_gcr_write(chip->port, MISC_CONTROL, tmp);
>  }
>  
> -static int snd_als300_free(struct snd_als300 *chip)
> +static void snd_als300_free(struct snd_card *card)
>  {
> -	snd_als300_set_irq_flag(chip, IRQ_DISABLE);
> -	if (chip->irq >= 0)
> -		free_irq(chip->irq, chip);
> -	pci_release_regions(chip->pci);
> -	pci_disable_device(chip->pci);
> -	kfree(chip);
> -	return 0;
> -}
> +	struct snd_als300 *chip = card->private_data;
>  
> -static int snd_als300_dev_free(struct snd_device *device)
> -{
> -	struct snd_als300 *chip = device->device_data;
> -	return snd_als300_free(chip);
> +	snd_als300_set_irq_flag(chip, IRQ_DISABLE);
>  }
>  
>  static irqreturn_t snd_als300_interrupt(int irq, void *dev_id)
> @@ -248,11 +238,6 @@ static irqreturn_t snd_als300plus_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static void snd_als300_remove(struct pci_dev *pci)
> -{
> -	snd_card_free(pci_get_drvdata(pci));
> -}
> -
>  static unsigned short snd_als300_ac97_read(struct snd_ac97 *ac97,
>  							unsigned short reg)
>  {
> @@ -610,35 +595,22 @@ static void snd_als300_init(struct snd_als300 *chip)
>  }
>  
>  static int snd_als300_create(struct snd_card *card,
> -			     struct pci_dev *pci, int chip_type,
> -			     struct snd_als300 **rchip)
> +			     struct pci_dev *pci, int chip_type)
>  {
> -	struct snd_als300 *chip;
> +	struct snd_als300 *chip = card->private_data;
>  	void *irq_handler;
>  	int err;
>  
> -	static const struct snd_device_ops ops = {
> -		.dev_free = snd_als300_dev_free,
> -	};
> -	*rchip = NULL;
> -
> -	err = pci_enable_device(pci);
> +	err = pcim_enable_device(pci);
>  	if (err < 0)
>  		return err;
>  
>  	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
>  		dev_err(card->dev, "error setting 28bit DMA mask\n");
> -		pci_disable_device(pci);
>  		return -ENXIO;
>  	}
>  	pci_set_master(pci);
>  
> -	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
> -	if (chip == NULL) {
> -		pci_disable_device(pci);
> -		return -ENOMEM;
> -	}
> -
>  	chip->card = card;
>  	chip->pci = pci;
>  	chip->irq = -1;
> @@ -646,11 +618,9 @@ static int snd_als300_create(struct snd_card *card,
>  	spin_lock_init(&chip->reg_lock);
>  
>  	err = pci_request_regions(pci, "ALS300");
> -	if (err < 0) {
> -		kfree(chip);
> -		pci_disable_device(pci);
> +	if (err < 0)
>  		return err;
> -	}
> +
>  	chip->port = pci_resource_start(pci, 0);
>  
>  	if (chip->chip_type == DEVICE_ALS300_PLUS)
> @@ -658,38 +628,29 @@ static int snd_als300_create(struct snd_card *card,
>  	else
>  		irq_handler = snd_als300_interrupt;
>  
> -	if (request_irq(pci->irq, irq_handler, IRQF_SHARED,
> -			KBUILD_MODNAME, chip)) {
> +	if (devm_request_irq(&pci->dev, pci->irq, irq_handler, IRQF_SHARED,
> +			     KBUILD_MODNAME, chip)) {
>  		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
> -		snd_als300_free(chip);
>  		return -EBUSY;
>  	}
>  	chip->irq = pci->irq;
>  	card->sync_irq = chip->irq;
> +	card->private_free = snd_als300_free;
>  
>  	snd_als300_init(chip);
>  
>  	err = snd_als300_ac97(chip);
>  	if (err < 0) {
>  		dev_err(card->dev, "Could not create ac97\n");
> -		snd_als300_free(chip);
>  		return err;
>  	}
>  
>  	err = snd_als300_new_pcm(chip);
>  	if (err < 0) {
>  		dev_err(card->dev, "Could not create PCM\n");
> -		snd_als300_free(chip);
> -		return err;
> -	}
> -
> -	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
> -	if (err < 0) {
> -		snd_als300_free(chip);
>  		return err;
>  	}
>  
> -	*rchip = chip;
>  	return 0;
>  }
>  
> @@ -737,20 +698,16 @@ static int snd_als300_probe(struct pci_dev *pci,
>  		return -ENOENT;
>  	}
>  
> -	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
> -			   0, &card);
> -
> +	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
> +				sizeof(*chip), &card);
>  	if (err < 0)
>  		return err;
>  
>  	chip_type = pci_id->driver_data;
>  
> -	err = snd_als300_create(card, pci, chip_type, &chip);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	err = snd_als300_create(card, pci, chip_type);
> +	if (err < 0)
>  		return err;
> -	}
> -	card->private_data = chip;
>  
>  	strcpy(card->driver, "ALS300");
>  	if (chip->chip_type == DEVICE_ALS300_PLUS)

clang warns:

sound/pci/als300.c:713:6: error: variable 'chip' is uninitialized when used here [-Werror,-Wuninitialized]
        if (chip->chip_type == DEVICE_ALS300_PLUS)
            ^~~~
sound/pci/als300.c:691:25: note: initialize the variable 'chip' to silence this warning
        struct snd_als300 *chip;
                               ^
                                = NULL
1 error generated.

> @@ -764,10 +721,9 @@ static int snd_als300_probe(struct pci_dev *pci,
>  				card->shortname, chip->port, chip->irq);
>  
>  	err = snd_card_register(card);
> -	if (err < 0) {
> -		snd_card_free(card);
> +	if (err < 0)
>  		return err;
> -	}
> +
>  	pci_set_drvdata(pci, card);
>  	dev++;
>  	return 0;
> @@ -777,7 +733,6 @@ static struct pci_driver als300_driver = {
>  	.name = KBUILD_MODNAME,
>  	.id_table = snd_als300_ids,
>  	.probe = snd_als300_probe,
> -	.remove = snd_als300_remove,
>  	.driver = {
>  		.pm = SND_ALS300_PM_OPS,
>  	},
> -- 
> 2.26.2
