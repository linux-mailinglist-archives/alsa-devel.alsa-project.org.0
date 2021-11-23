Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE9B45B50B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:12:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71AA01758;
	Wed, 24 Nov 2021 08:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71AA01758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737969;
	bh=j0TtjVRAXnlQOYES3s7A3bBt/63q5m2VxB7PfnQ+868=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ERcf2OeEAOECd1SikWSPSAFjlF6GZMVG1unyFT9QzCg417LPZC/IkCZpV//WgIqP/
	 kYYMer4Y6XGSiJEOeskuo/jwsnvA/p1WZxfFqYt9D2RLawu1LUJLuLtyXPoh+oNWDs
	 bZCX15sTIiaVFt06vxNYHaOoS5yOcfzjSyAJdx6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60152F8058C;
	Wed, 24 Nov 2021 08:06:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3D8BF8049E; Tue, 23 Nov 2021 18:00:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D33AF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D33AF80154
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="234884070"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="234884070"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 08:59:51 -0800
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="497343295"
Received: from markmu6x-mobl.amr.corp.intel.com (HELO [10.213.168.54])
 ([10.213.168.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 08:59:48 -0800
Subject: Re: [PATCH 10/11] hda: cs35l41: Add support for CS35L41 in HDA systems
To: Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Kailang Yang <kailang@realtek.com>, Shuming Fan <shumingf@realtek.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-11-tanureal@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d8fe13f2-ac84-51b6-8eb5-095176a65c39@linux.intel.com>
Date: Tue, 23 Nov 2021 10:59:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123163149.1530535-11-tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jack Yu <jack.yu@realtek.com>, Arnd Bergmann <arnd@arndb.de>,
 Jeremy Szu <jeremy.szu@canonical.com>, patches@opensource.cirrus.com,
 Elia Devito <eliadevito@gmail.com>, alsa-devel@alsa-project.org,
 Werner Sembach <wse@tuxedocomputers.com>, platform-driver-x86@vger.kernel.org,
 Hui Wang <hui.wang@canonical.com>, linux-acpi@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Sami Loone <sami@loone.fi>,
 Cameron Berkenpas <cam@neo-zeon.de>, linux-kernel@vger.kernel.org
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


> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id cs35l41_acpi_hda_match[] = {
> +	{"CLSA0100", 0 },

I could be wrong but this doesn't look like a legit ACPI _HID?

Cirrus Logic can use 'CIR', "CLI", or 'CSC' PNP ID, or an PCI ID.

in the past you used

+#ifdef CONFIG_ACPI
+static const struct acpi_device_id cs35l41_acpi_match[] = {
+	{ "CSC3541", 0 }, /* Cirrus Logic PnP ID + part ID */
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
+#endif


