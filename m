Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3AB45B51D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:14:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F5CD177F;
	Wed, 24 Nov 2021 08:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F5CD177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738086;
	bh=LFxlldPIfAAd2/heeVPDB48/3GkfN+W/Ar5np2nlsKA=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYFUut2PBCzKVftYinchk+4NVNgG7h2gfWfGPPH0AhsfhG3FtVoMVXE3Mz8daj81f
	 hCoAo/Mwo3OGpANqR+rWHZZDlbQPvVYLHcogQsou6n8lNCgF4LH5r0nThzjLfBUyZ0
	 YEHYtuFklhrd55pXC3TGzrtU8CHlfbE6+g0jQAnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34196F805C3;
	Wed, 24 Nov 2021 08:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B67EF8049E; Tue, 23 Nov 2021 18:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 830E6F80087
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 18:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 830E6F80087
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="235018362"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="235018362"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 09:16:43 -0800
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="497349857"
Received: from markmu6x-mobl.amr.corp.intel.com (HELO [10.213.168.54])
 ([10.213.168.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 09:16:39 -0800
Subject: Re: [PATCH 10/11] hda: cs35l41: Add support for CS35L41 in HDA systems
To: tanureal@opensource.cirrus.com, "Rafael J.Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>, David Rhodes <david.rhodes@cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Hui Wang <hui.wang@canonical.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Chris Chiu <chris.chiu@canonical.com>, Cameron Berkenpas <cam@neo-zeon.de>,
 Sami Loone <sami@loone.fi>, Elia Devito <eliadevito@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jack Yu <jack.yu@realtek.com>, Arnd Bergmann <arnd@arndb.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, linux-acpi@vger.kernel.org,
 patches@opensource.cirrus.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-11-tanureal@opensource.cirrus.com>
 <d8fe13f2-ac84-51b6-8eb5-095176a65c39@linux.intel.com>
 <ebb877d5-e348-e5fe-a5cb-9ef579a312f5@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a2ef9f32-0a92-d8cc-8e4a-7d4d4abcc7e9@linux.intel.com>
Date: Tue, 23 Nov 2021 11:16:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ebb877d5-e348-e5fe-a5cb-9ef579a312f5@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
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



On 11/23/21 11:06 AM, tanureal@opensource.cirrus.com wrote:
> On 11/23/21 4:59 PM, Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>> > +#ifdef CONFIG_ACPI
>> > +static const struct acpi_device_id cs35l41_acpi_hda_match[] = {
>> > +    {"CLSA0100", 0 },
>>
>> I could be wrong but this doesn't look like a legit ACPI _HID?
>>
>> Cirrus Logic can use 'CIR', "CLI", or 'CSC' PNP ID, or an PCI ID.
>>
>> in the past you used
>>
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id cs35l41_acpi_match[] = {
>> +    { "CSC3541", 0 }, /* Cirrus Logic PnP ID + part ID */
>> +    {},
>> +};
>> +MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
>> +#endif
>>
>>
>>
> 
> This ACPI _HID is already released, there is nothing I can do about it.
> Future devices will use 'CSC' PnP ID.

ok, add a comment then that you're adding support for an
already-released value that's not compliant.
