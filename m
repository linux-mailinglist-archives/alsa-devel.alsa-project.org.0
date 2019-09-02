Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B74BA5413
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 12:34:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5DBA16B1;
	Mon,  2 Sep 2019 12:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5DBA16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567420469;
	bh=uw/9kyBg/EZBdrsfX/lR/J2Ut8s5gL2TcBW+OdElEoQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3hnBq/jejviRgIFyw/xEp9wUfdHKqNmZqz+9K9RWDXTNTVmsBxr9PtqfEJhOCYK7
	 rOXGfHbEzyf0QcMV9eQGnx6B831SPnnp8kRQfMpZrQFYiL5kKyq0eAPsv36antgk1m
	 Ox5N1cox8+FxT2wX5T04cspczrekkr0lQlCbpvAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C1E7F80447;
	Mon,  2 Sep 2019 12:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BED9F803D0; Mon,  2 Sep 2019 12:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092070098.outbound.protection.outlook.com [40.92.70.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A17ADF80392
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 12:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17ADF80392
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7RL4JzppThEOGuni15BfXQKo4eraxoUWeYC5SS+EC/O6myKg+q0rXwYK03QFGa6qIhvITEsg5SyOOmOHKrIVmPJyfNKKHWv3/zPQR+hA+4t6JQtSTkVFho7a94S//JdUQqgSbytC7pDQE+kDBf4K5BbDDYJQ27TGkaBl16TsOYWgJDnOyAL4+rVdwRTOUr+dqp1au5hiJFtY2T2q63GvCmwuXY9rOftEAVxbhIeDS76rVxl8E421mIIturOK8TRdMRi9ypMLXRcAaLXlZZ/zU+1pDfY3nIj0PDPL1pXE0fWCN/Ucc/p1T1UtYpkpmnLo9hz06fDF954Wy7rCtb9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMy0bYrDmhv8lbTruCvXNPgcPqXv372WjYxd1S80E7s=;
 b=PqtFtgL9qfsy0+lXQqm0r+aiFCzXFgUKeEHG0vuhKuqsbJWTnpU/8WabxMADJi0tvNEF8iU3AyTPyJdvOpNZh4KADA7pFGOmngtsalc/1M4jgebM2TGfUxLdnRONL1p0GhLjCVB9clb51XFUSjKkNvr95BzCQwX0VRqqqwTupgH/w3H+RbqGIpmtI14qQ0UJWXOd5tNBddYlm/9B9OEjSG0rm4C4rQWBX4Hh5ZvtdIcaB/+sWZEQz9iALGOaw6UePy9r+uAK1EY06msfjXm6YgP6PdkhlHyfTXjPXJSeZQOsUmE/NpBgg7EDslji/8znAj9zGoB/P+4BQaKfwBHuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (10.152.16.56) by AM5EUR03HT039.eop-EUR03.prod.protection.outlook.com
 (10.152.17.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Mon, 2 Sep
 2019 10:32:38 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.16.60) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Mon, 2 Sep 2019 10:32:38 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036%5]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:32:37 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <narmstrong@baylibre.com>, Cheng-Yi Chiang
 <cychiang@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v2] drm: dw-hdmi-i2s: enable audio clock in audio_startup
Thread-Index: AQHVYUIsW0s7539kVU2Jt4QPypUBOKcYIv4AgAAN9AA=
Date: Mon, 2 Sep 2019 10:32:37 +0000
Message-ID: <HE1PR06MB4011E2F58875F30446D902BFACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190902035435.44463-1-cychiang@chromium.org>
 <241fd791-3792-34c8-ac35-a81a0a41070c@baylibre.com>
In-Reply-To: <241fd791-3792-34c8-ac35-a81a0a41070c@baylibre.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0020.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::30) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:11AFA484E24FBB2CDB4BF31F98FE745128D47FBAE604F925178CCA20798AFEF0;
 UpperCasedChecksum:CEAEE32EF148EBB03EB444A95DF68042F6507D089325A6FC5FE9125E539400DE;
 SizeAsReceived:8557; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [A8LugvH9kj5T4xfRlk+80mbCfMFbMrmW]
x-microsoft-original-message-id: <d6fa2d56-335b-e15d-da18-749ea0341fad@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119158)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT039; 
x-ms-traffictypediagnostic: AM5EUR03HT039:
x-microsoft-antispam-message-info: aPYwSGaRGf/92nAQF7WaYOyubhfYLufZAH+FzJ9zdaNyO4ale39c/SDQ8VerWyS8qfidyZqVm3lWQUxlMf+YMp5pW0YO74TbIMgWC/2ck7aCNT3CyKJ20Wf8vQFlvNnlI8Z1eNL4y0AeZsmrzNHr8rmgL2Wq8nVdVEjB6Jo8ZgQeqi27NodGvdkrcyadRWyZ
x-ms-exchange-transport-forked: True
Content-ID: <28AEFB56CC9D7540A050CC1E73674443@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f14e6ad-372f-4349-ed8d-08d72f90dfc7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:32:37.8279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT039
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2] drm: dw-hdmi-i2s: enable audio clock in
	audio_startup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-09-02 11:42, Neil Armstrong wrote:
> Hi,
>
> On 02/09/2019 05:54, Cheng-Yi Chiang wrote:
>> In the designware databook, the sequence of enabling audio clock and
>> setting format is not clearly specified.
>> Currently, audio clock is enabled in the end of hw_param ops after
>> setting format.
>>
>> On some monitors, there is a possibility that audio does not come out.
>> Fix this by enabling audio clock in audio_startup ops
>> before hw_param ops setting format.
>>
>> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
>> Tested-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>  Changes from v1:
>>  1. Move audio_startup to the front of audio_shutdown.
>>  2. Fix the indentation of audio_startup equal sign using tab.
>>  3. Rebase the patch on linux-next/master.
>>  4. Add Reviewed-by and Tested-by fields from dianders@chromium.org.
>>  5. Add Reviewed-by field from jonas@kwiboo.se.
>>
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> index 1d15cf9b6821..34d8e837555f 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> @@ -109,6 +109,14 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>>  	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
>>  	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
>>  
>> +	return 0;
>> +}
>> +
>> +static int dw_hdmi_i2s_audio_startup(struct device *dev, void *data)
>> +{
>> +	struct dw_hdmi_i2s_audio_data *audio = data;
>> +	struct dw_hdmi *hdmi = audio->hdmi;
>> +
>>  	dw_hdmi_audio_enable(hdmi);
>>  
>>  	return 0;
>> @@ -153,6 +161,7 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>>  
>>  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
>>  	.hw_params	= dw_hdmi_i2s_hw_params,
>> +	.audio_startup  = dw_hdmi_i2s_audio_startup,
>>  	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
>>  	.get_eld	= dw_hdmi_i2s_get_eld,
>>  	.get_dai_id	= dw_hdmi_i2s_get_dai_id,
>>
> Looks sane, Jonas should I apply it now it's rebased ?

Sure, looks sane and compiles without warnings on my build host.

Regards,
Jonas

>
> Neil

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
