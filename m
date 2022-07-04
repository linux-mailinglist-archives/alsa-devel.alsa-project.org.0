Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BF65651E5
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 12:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8AAF16F0;
	Mon,  4 Jul 2022 12:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8AAF16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656929807;
	bh=Wp38N4SNDoeB0cprEq3K6Lkt9Ev750NsKrEe216wj+Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ROcNj3tTew1UBRzvXZK1WvVExcP6HhEWS78c4KYZOZhfGx8y1oDlBs2aZof2ImNKd
	 ZUIyrm+YCc/y71/OqIK4cqIdeTUBTMhXt/v/LQCQci5K0aS4aNOjsRRetrEEdeO5zL
	 +AcHKqpPwtlc0SvL92tQyqauYONH8Nj8w9spUC/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53EB2F80165;
	Mon,  4 Jul 2022 12:15:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6539FF8014E; Mon,  4 Jul 2022 12:15:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48F51F8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 12:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48F51F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="F7tmh+Jo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2645Z9NJ023931;
 Mon, 4 Jul 2022 05:15:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=eKPUZThOeVTIZnGIj8YxsTsMCnV73vohaSA5rmR9v4g=;
 b=F7tmh+JoX0h+qyYxqf8OgTj8F7pcvT/3b1kGu/0a+4khZsWXks+BJk/D6TSFYdfdFfgL
 qbLYXoDehdvQYpyXPGL6YQG1HNasK3ozwp2WK/1ble94nWXbXfaejAJDfdDujKbK3pxE
 OG/HIkz/kExR7HmpZRdDpbXbiwSjQSrLj5MJo7Fu4kVmIo6if8fXbILmgvdKHphGSztt
 Klex8eqhk5PQmqmLnQTVtfznPA8UQOS8jwqcJYOyGocQsaeQlVDVv7+wWkO9h2VjHSVc
 ygzg7pnvASboQpN3LuDTUuFCs5cGQbR0wbIYRcJBU+e14FvL5vB6F45+354PQuNf8JSr /A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3h2jeqhyad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 04 Jul 2022 05:15:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 4 Jul
 2022 11:15:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 4 Jul 2022 11:15:39 +0100
Received: from [198.90.202.50] (unknown [198.90.202.50])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D00B52A9;
 Mon,  4 Jul 2022 10:15:26 +0000 (UTC)
Message-ID: <f7876785-3895-7494-6d64-7ba64a5d290d@opensource.cirrus.com>
Date: Mon, 4 Jul 2022 11:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ALSA: hda: add CSC3551 support for UM5302TA
Content-Language: en-US
To: xhe <xw897002528@gmail.com>
References: <20220703053225.2203-1-xw897002528@gmail.com>
From: Lucas Tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <20220703053225.2203-1-xw897002528@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -Z0dxOpRqS1jDKGCKqRl7GMmV6o9zwHp
X-Proofpoint-ORIG-GUID: -Z0dxOpRqS1jDKGCKqRl7GMmV6o9zwHp
X-Proofpoint-Spam-Reason: safe
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Kailang Yang <kailang@realtek.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Xiaoyan Li <lxy.lixiaoyan@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, Tim Crawford <tcrawford@system76.com>,
 Andy Chi <andy.chi@canonical.com>, Cameron Berkenpas <cam@neo-zeon.de>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Yong Wu <yong.wu@mediatek.com>
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

On 7/3/22 06:32, xhe wrote:
> From: He Wang <xw897002528@gmail.com>
>
> ASUS UM5302TA are using csc3551, or cs35l41, which is connected to the
> laptop by I2C bus. This patch adds quirk for the sound card, and avoid
> ACPI DSD things for i2c-multi-instantiate cases like CLSA0100.
>
> Patch is made by XiaoYan Li. It is tested by us on ASUS UM5302TA.
>
> Signed-off-by: He Wang <xw897002528@gmail.com>
> Signed-off-by: Xiaoyan Li <lxy.lixiaoyan@gmail.com>
> ---
>   sound/pci/hda/cs35l41_hda.c   | 2 +-
>   sound/pci/hda/patch_realtek.c | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index cce27a86267f..7374565ecf15 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -420,7 +420,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
>   	 * And devm functions expect that the device requesting the resource has the correct
>   	 * fwnode.
>   	 */
> -	if (strncmp(hid, "CLSA0100", 8) != 0)
> +	if (strncmp(hid, "CLSA0100", 8) != 0 && strncmp(hid, "CSC3551", 7) != 0)

Hi,

Sorry, but this is wrong. It's configuring the device as external boost, 
but the correct is internal boost for this device.

Before accepting any new laptops to be supported, we would like to get 
the Firmware support merged first.

Thanks

Lucas

>   		return -EINVAL;
>   
>   	/* check I2C address to assign the index */
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index cee69fa7e246..49c27d948582 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -9138,6 +9138,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
>   	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
>   	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
> +	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302TA", ALC287_FIXUP_CS35L41_I2C_2),
>   	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
>   	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
>   	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
