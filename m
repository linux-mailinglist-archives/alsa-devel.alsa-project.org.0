Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C051423E5C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 15:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E629166A;
	Wed,  6 Oct 2021 15:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E629166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633525344;
	bh=NcVANR3MespWZq/3f1e2FIX09Tuiz6VTTMKJi7G5pWI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJkQRpy7U0Cz9OF+qKKsQk6lWKctK+J/NWNxG2cX3ozIrwrVlWuODk8sgW3HEuHm+
	 nSB+/YMxjWM9zICNdwGuNSB2J2eqRPfPCIFQk1CLd3CYJi2uxrHg3nlHOqQY6CeySO
	 FczSOEIYFd22Frd0fYbZnq6Q+BRYDzGYXvuQ+rCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38559F80229;
	Wed,  6 Oct 2021 15:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C47F80240; Wed,  6 Oct 2021 15:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB32EF800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 15:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB32EF800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="289487108"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="289487108"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 06:00:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439108427"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 06:00:20 -0700
Subject: Re: [PATCH] ASoC: soc-acpi: add alternative id field for machine
 driver matching
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20211006084351.438510-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <da650858-6523-4813-6433-438e974d060a@linux.intel.com>
Date: Wed, 6 Oct 2021 07:17:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006084351.438510-1-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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



On 10/6/21 3:43 AM, Brent Lu wrote:
> Current design to support second headphone driver in the same machine
> driver is to duplicate the entries in snd_soc_acpi_mach array and
> board configs in machine driver. We can avoid this by adding an id_alt
> field in snd_soc_acpi_mach structure to specify alternative ACPI HIDs
> for machine driver enumeration and leave the codec type detection to
> machine driver if necessary.

I am not following your suggestion. The machine drivers for I2S/TDM
platforms are typically based on specific headphone codecs, and they we
add possible swaps for amplifiers. The key to find a machine is
typically the headphone HID. Exhibit A for this in your own contribution
in the recent weeks with the sof_cs42l42.c machine driver.

Are you suggesting we unify e.g. sof_rt5682.c and sof_cs42l42.c?

The other problem is that today we have one main HID along with
'quirk_data' for amplifiers. If we have alternate HIDs, what would be
the rule for quirk_data? Can the quirks apply to all possible alternate
HIDs? Only one of them?

Without an example where this new alternate ID is used it's hard to see
what the ask and directions might be.

Care to elaborate?
Thanks!

> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  include/sound/soc-acpi.h |  2 ++
>  sound/soc/soc-acpi.c     | 21 ++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
> index 2f3fa385c092..fcf6bae9f9d7 100644
> --- a/include/sound/soc-acpi.h
> +++ b/include/sound/soc-acpi.h
> @@ -129,6 +129,7 @@ struct snd_soc_acpi_link_adr {
>   * all firmware/topology related fields.
>   *
>   * @id: ACPI ID (usually the codec's) used to find a matching machine driver.
> + * @id_alt: array of ACPI IDs used as an alternative of id field.
>   * @link_mask: describes required board layout, e.g. for SoundWire.
>   * @links: array of link _ADR descriptors, null terminated.
>   * @drv_name: machine driver name
> @@ -146,6 +147,7 @@ struct snd_soc_acpi_link_adr {
>  /* Descriptor for SST ASoC machine driver */
>  struct snd_soc_acpi_mach {
>  	const u8 id[ACPI_ID_LEN];
> +	struct snd_soc_acpi_codecs *id_alt;
>  	const u32 link_mask;
>  	const struct snd_soc_acpi_link_adr *links;
>  	const char *drv_name;
> diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
> index 395229bf5c51..ab67d640c20f 100644
> --- a/sound/soc/soc-acpi.c
> +++ b/sound/soc/soc-acpi.c
> @@ -8,6 +8,25 @@
>  #include <linux/module.h>
>  #include <sound/soc-acpi.h>
>  
> +static bool snd_soc_acpi_id_present(struct snd_soc_acpi_mach *machine)
> +{
> +	struct snd_soc_acpi_codecs *id_alt = machine->id_alt;
> +	int i;
> +
> +	if (acpi_dev_present(machine->id, NULL, -1))
> +		return true;
> +
> +	if (id_alt == NULL)
> +		return false;
> +
> +	for (i = 0; i < id_alt->num_codecs; i++) {
> +		if (acpi_dev_present(id_alt->codecs[i], NULL, -1))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  struct snd_soc_acpi_mach *
>  snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
>  {
> @@ -15,7 +34,7 @@ snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
>  	struct snd_soc_acpi_mach *mach_alt;
>  
>  	for (mach = machines; mach->id[0]; mach++) {
> -		if (acpi_dev_present(mach->id, NULL, -1)) {
> +		if (snd_soc_acpi_id_present(mach) != false) {
>  			if (mach->machine_quirk) {
>  				mach_alt = mach->machine_quirk(mach);
>  				if (!mach_alt)
> 
