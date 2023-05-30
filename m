Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66825715A4E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 11:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 393616C0;
	Tue, 30 May 2023 11:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 393616C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685439443;
	bh=t3IbGaJMNEkWwrjDgogwQStnwAPEhanueTaQCr8mZOs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lIeg/I5EpY0giaVLa9stQgu9NdrSo+HM5TP8hFDPpMJU/zi0OCCMntLQWcZed1rBP
	 dLR5HADt9aBunBsy0cJvCiQUA4cWq6/nIs/U8GWtjX8Au60Dnpu+vzdvKU8xxFpzWn
	 MJxwCDB79hI0nS71PswDVuxUun7X9fk4bolyoL4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A18B7F80548; Tue, 30 May 2023 11:36:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E3A9F8026A;
	Tue, 30 May 2023 11:36:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 084BFF8042F; Tue, 30 May 2023 11:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11FEEF80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 11:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11FEEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FEvk9mUu
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U8fdTM024574;
	Tue, 30 May 2023 04:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=KHDijHzgsVXY1MQfmw7OOY+PLkzfOlr/Cua2+1zmRfs=;
 b=FEvk9mUuRCqyJYHdD1whGFFj5kV4MctpWzcVqd85UicdaXvfWSrCfpl80aIALoeVu1Fe
 1gdt03ogMxv6qHsxBCZrD96yeDIhrK2A/by27Sg6q6rfQo4cXwtTGxFI6cyIPX5TsQrj
 dSPKGORI4hzkFdC1164eG2nhB43DNZMxZWR7oX0jFArg7j1wUTtctuJI9CIGV8XC7vC/
 1Aasqu5XCnM1px0toPhNO5UxN5sa4IWxhexDHloh4boIcUGIJ1Xc7702TpODsM2anDa1
 VKyH48r6mTd7wCf6RdbtoSiBd1VXGT1vFFD41xQCitkl8yKYYmGrsUa3adKkyCJ8WkF4 jw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3quf90txf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 04:34:13 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 30 May
 2023 10:34:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 May 2023 10:34:11 +0100
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2C485475;
	Tue, 30 May 2023 09:34:11 +0000 (UTC)
Message-ID: <e64614db-8633-55ad-f5db-68ef8a371dfa@opensource.cirrus.com>
Date: Tue, 30 May 2023 10:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 12/12] ALSA: hda/cs35l56: Add driver for Cirrus Logic
 CS35L56 amplifier
Content-Language: en-US
To: <Claudiu.Beznea@microchip.com>, <tiwai@suse.com>, <broonie@kernel.org>,
        <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <simont@opensource.cirrus.com>
References: <20230526122852.4552-1-rf@opensource.cirrus.com>
 <20230526122852.4552-13-rf@opensource.cirrus.com>
 <4ec68c42-dbab-5006-c6a5-0be147a7d0f1@microchip.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <4ec68c42-dbab-5006-c6a5-0be147a7d0f1@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9XoKl8oyEkvkJrjyPkZbuGQy29DXhfpT
X-Proofpoint-ORIG-GUID: 9XoKl8oyEkvkJrjyPkZbuGQy29DXhfpT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PPCULR5TDILB34WLKZCKJAWC7TI6MXMJ
X-Message-ID-Hash: PPCULR5TDILB34WLKZCKJAWC7TI6MXMJ
X-MailFrom: prvs=151462e483=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPCULR5TDILB34WLKZCKJAWC7TI6MXMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/05/2023 08:39, Claudiu.Beznea@microchip.com wrote:
> On 26.05.2023 15:28, Richard Fitzgerald wrote:
>> +static int cs35l56_hda_request_firmware_file(struct cs35l56_hda *cs35l56,
>> +                                            const struct firmware **firmware, char **filename,
>> +                                            const char *dir, const char *system_name,
>> +                                            const char *amp_name,
>> +                                            const char *filetype)
>> +{
>> +       char *s, c;
>> +       int ret = 0;
>> +
>> +       if (system_name && amp_name)
>> +               *filename = kasprintf(GFP_KERNEL, "%scs35l56%s-%02x-dsp1-misc-%s-%s.%s", dir,
>> +                                     cs35l56->base.secured ? "s" : "", cs35l56->base.rev,
>> +                                     system_name, amp_name, filetype);
>> +       else if (system_name)
>> +               *filename = kasprintf(GFP_KERNEL, "%scs35l56%s-%02x-dsp1-misc-%s.%s", dir,
>> +                                     cs35l56->base.secured ? "s" : "", cs35l56->base.rev,
>> +                                     system_name, filetype);
>> +       else
>> +               *filename = kasprintf(GFP_KERNEL, "%scs35l56%s-%02x-dsp1-misc.%s", dir,
>> +                                     cs35l56->base.secured ? "s" : "", cs35l56->base.rev,
>> +                                     filetype);
>> +
>> +       if (!*filename)
>> +               return -ENOMEM;
>> +
>> +       /*
>> +        * Make sure that filename is lower-case and any non alpha-numeric
>> +        * characters except full stop and forward slash are replaced with
>> +        * hyphens.
>> +        */
>> +       s = *filename;
>> +       while (*s) {
>> +               c = *s;
>> +               if (isalnum(c))
>> +                       *s = tolower(c);
>> +               else if (c != '.' && c != '/')
>> +                       *s = '-';
>> +               s++;
>> +       }
>> +
>> +       ret = firmware_request_nowarn(firmware, *filename, cs35l56->base.dev);
>> +       if (ret) {
>> +               dev_dbg(cs35l56->base.dev, "Failed to request '%s'\n", *filename);
>> +               kfree(*filename);
>> +               *filename = NULL;
>> +       } else {
>> +               dev_dbg(cs35l56->base.dev, "Found '%s'\n", *filename);
> 
> I may be wrong but *filename seems leaked to me on this path. I noticed it
> is could be duplicated on cs_dsp_debugfs_save_wmfwname() but the original
> copy seems left aside.
> 

It's not a leak. The file has been found so the name of the found
file is returned (it's used by other code). But there is a leak of that
memory elsewhere.

>> +       }
>> +
>> +       return ret;
>> +}
> 
