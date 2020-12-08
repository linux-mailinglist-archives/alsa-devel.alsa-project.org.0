Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016E2D30C8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 18:17:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995111694;
	Tue,  8 Dec 2020 18:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995111694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607447834;
	bh=/watSl22krOpfsKxhodnXhWrT6VnUTiv9EZ2eMy4ses=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ce8gjPuhYd76bc86m4T91VAbLOIF2uFeusaVs4ZMJKQ03GxnejYX5MXj/bHb7LsZr
	 LQRclK0vfvGrvzYFru9vOTuFJrSlDxUlnGz8yvj57tktysMbeLkWasQLqRjw5Pm8K/
	 6OsKmY9/DOAHlWIzVeS2GDn/msDLBlnSl8veyXwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF923F80218;
	Tue,  8 Dec 2020 18:15:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B0D8F8019D; Tue,  8 Dec 2020 18:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 844F2F80130
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 18:15:32 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A84C3A0040;
 Tue,  8 Dec 2020 18:15:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A84C3A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607447730; bh=pyCq40eCnaC1hGddOxIZcS1+zanpft1w+iLqSKShGKo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MWV25CFUUBuqzEtj5NajPCAxureVC2Zkh5NBXCMUnNVSb2cVIv3Gq6yWxl2qS4gSj
 4wB31KhE6KxrpQLNv3wn/k6+By0DH6OYB6L4sZXwiTRcjz45CRyL5SUDvU9JO6iYKj
 RNcDppBc6rQ1YvFs7AzySbBoG9clcdW6e9rpDjgU=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Dec 2020 18:15:25 +0100 (CET)
Subject: Re: [PATCH] ASoC: AMD Renoir - add DMI table to avoid the ACP mic
 probe (broken BIOS)
To: Takashi Iwai <tiwai@suse.de>
References: <20201208153654.2733354-1-perex@perex.cz>
 <s5h4kkww9j3.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <bad57347-47a2-fa8e-c5bf-4d7b0c4daedf@perex.cz>
Date: Tue, 8 Dec 2020 18:15:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <s5h4kkww9j3.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, stable@kernel.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Dne 08. 12. 20 v 17:24 Takashi Iwai napsal(a):
> On Tue, 08 Dec 2020 16:36:54 +0100,
> Jaroslav Kysela wrote:
>>
>> Users reported that some Lenovo AMD platforms do not have ACP microphone,
>> but the BIOS advertises it via ACPI.
>>
>> This patch create a simple DMI table, where those machines with the broken
>> BIOS can be added. The DMI description for Lenovo IdeaPad 5 and
>> IdeaPad Flex 5 devices are added there.
>>
>> Also describe the dmic_acpi_check kernel module parameter in a more
>> understandable way.
>>
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1892115
>> Cc: <stable@kernel.org>
>> Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> ---
>>  sound/soc/amd/renoir/rn-pci-acp3x.c | 28 +++++++++++++++++++++++-----
>>  1 file changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
>> index b943e59fc302..3289ab3eae6f 100644
>> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
>> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
>> @@ -6,6 +6,7 @@
>>  
>>  #include <linux/pci.h>
>>  #include <linux/acpi.h>
>> +#include <linux/dmi.h>
>>  #include <linux/module.h>
>>  #include <linux/io.h>
>>  #include <linux/delay.h>
>> @@ -20,14 +21,13 @@ module_param(acp_power_gating, int, 0644);
>>  MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
>>  
>>  /**
>> - * dmic_acpi_check = -1 - Checks ACPI method to know DMIC hardware status runtime
>> - *                 = 0 - Skips the DMIC device creation and returns probe failure
>> - *                 = 1 - Assumes that platform has DMIC support and skips ACPI
>> - *                       method check
>> + * dmic_acpi_check = -1 - Use ACPI/DMI method to detect the DMIC hardware presence at runtime
>> + *                 =  0 - Skip the DMIC device creation and return probe failure
>> + *                 =  1 - Force DMIC support
>>   */
>>  static int dmic_acpi_check = ACP_DMIC_AUTO;
>>  module_param(dmic_acpi_check, bint, 0644);
>> -MODULE_PARM_DESC(dmic_acpi_check, "checks Dmic hardware runtime");
>> +MODULE_PARM_DESC(dmic_acpi_check, "Digital microphone presence (-1=auto, 0=none, 1=force)");
>>  
>>  struct acp_dev_data {
>>  	void __iomem *acp_base;
>> @@ -163,6 +163,17 @@ static int rn_acp_deinit(void __iomem *acp_base)
>>  	return 0;
>>  }
>>  
>> +static const struct dmi_system_id rn_acp_quirk_table[] = {
>> +	{
>> +		/* Lenovo IdeaPad Flex 5 14ARE05, IdeaPad 5 15ARE05 */
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
>> +		}
>> +	},
>> +	{}
>> +};
>> +
>>  static int snd_rn_acp_probe(struct pci_dev *pci,
>>  			    const struct pci_device_id *pci_id)
>>  {
>> @@ -172,6 +183,7 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>>  	acpi_handle handle;
>>  	acpi_integer dmic_status;
>>  #endif
>> +	const struct dmi_system_id *dmi_id;
>>  	unsigned int irqflags;
>>  	int ret, index;
>>  	u32 addr;
>> @@ -232,6 +244,12 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
>>  			goto de_init;
>>  		}
>>  #endif
>> +		dmi_id = dmi_first_match(rn_acp_quirk_table);
>> +		if (dmi_id && !dmi_id->driver_data) {
>> +			dev_warn(&pci->dev, "ACPI settings override using DMI (ACP mic is not present)");
> 
> IMO, better to be dev_info() here.  It's the correct set up, hence
> it should be neither error nor warning that appears in the boot screen
> over the boot splash.

I sent v2 with this change. Thanks.

> BTW, both Raven and Reonir drivers point to the very same PCI ID,
> and both drivers will be probed for this machine (and both to be
> skipped).

It looks like a bad design. I believe that only one PCI module (driver) should
handle this PCI device and do the I2S / PDM redirection in the PCI probe callback.

> Also, I noticed that Renoir driver tries to detect the dmic at the
> late stage; this could be done at the very beginning, so the whole
> allocation and initialization could be simply skipped.  But this can
> be done in a separate cleanup patch.

Vijendar, could you give a look?

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
