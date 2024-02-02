Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F222847558
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 17:49:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E83684C;
	Fri,  2 Feb 2024 17:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E83684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706892594;
	bh=+im1RKMjzZ4h3VkkKdLOvJQjbpmu5h9lZoheruaIOSo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ril5cUWkRucAgPz91qBxyCEqaoWOOUneHhC+COBTdL5Bt69av8Whn6FYGHO5cGE5d
	 tMuSw/SMgcQS6MVND6ExJz2ZItO7hyog6aMVuUMJSOYCHiscQMo0v5QbVLNgmKkARQ
	 7MSVcGe2zaZ4ICKjb/vj/pw+HBgnXj6MvbFkqbcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 483C7F80149; Fri,  2 Feb 2024 17:49:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E149F8059F;
	Fri,  2 Feb 2024 17:49:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94312F8055C; Fri,  2 Feb 2024 17:49:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E584FF80149
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 17:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E584FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mwJEOoIp
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412G7Mcq013162;
	Fri, 2 Feb 2024 10:49:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=U8WQG/27RFVW0T/lszOLDs3q2p3WIe4SF89sGIgigVI=; b=
	mwJEOoIpTHTDlrg6DfTlGWj1YlyXozpO2dWPs/4lAIaCxX4ADSv9xgsnFKk5P0Mm
	6E/FLh4w6EpBrodBUhgDociv1xy1juZHJyiOKbQo0Ln+O26I+UsWyzdnhPWSplF/
	orKwXlHM11LVeQEKnTaJdP5ccRPGPyjBOwc0M0Z5AoVYJxhc4XMNmgpH7/DxtlU4
	80CysspmRbMYv9YpJREQYAgUhf2pudnky0rru8yPbURhAvjkVuycgy+4DnR8Xcca
	SprHUylSvm54INyyzLVExYZaHnk+reSgSqW98C+21mRWy8u32QVnpj5HlfkrlSVI
	ZTCSlEFxC+as4xg5+pA85Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w0pwx0rnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 10:49:08 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 16:49:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 16:49:06 +0000
Received: from [198.90.238.164] (LONN2DGDQ73.ad.cirrus.com [198.90.238.164])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B0A01820246;
	Fri,  2 Feb 2024 16:49:06 +0000 (UTC)
Message-ID: <5792f9bc-b77d-4a90-be61-a09797295a8b@opensource.cirrus.com>
Date: Fri, 2 Feb 2024 16:49:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ALSA: hda/realtek: Remove two HP Laptops using CS35L41
To: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240202161727.321373-1-sbinding@opensource.cirrus.com>
 <87v876bz6b.wl-tiwai@suse.de>
Content-Language: en-GB
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <87v876bz6b.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7hVQcVNpn4yaQ_qZEnDXAyxZuy54POCT
X-Proofpoint-ORIG-GUID: 7hVQcVNpn4yaQ_qZEnDXAyxZuy54POCT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 72ZFPRPVPHBBNS3Y6UPX3PYGFTAVODCU
X-Message-ID-Hash: 72ZFPRPVPHBBNS3Y6UPX3PYGFTAVODCU
X-MailFrom: prvs=97625aa8a4=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72ZFPRPVPHBBNS3Y6UPX3PYGFTAVODCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 02/02/2024 16:37, Takashi Iwai wrote:
> On Fri, 02 Feb 2024 17:17:27 +0100,
> Stefan Binding wrote:
>> These two HP laptops are changing configurations.
> What exactly does this mean?  The PCI SSIDs are no longer valid, or
> the quirk became wrong, or what?
>
>
> thanks,
>
> Takashi

The SKUs, and associated SSIDs, are no longer going to include the CS35L41.
They may come back, but will need a different quirk.Sorry for the churn.

Thanks,
Stefan

