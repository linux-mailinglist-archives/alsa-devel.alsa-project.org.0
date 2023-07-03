Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8474555A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 08:17:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93F8884C;
	Mon,  3 Jul 2023 08:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93F8884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688365070;
	bh=VoviLtGj73Hdn8aerN9B95sbxR73r/3shDZo0XpESvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BtU5/iyU5Qet5DANd45i+N7Y9jzw49dLuxfpQbeJEjYuuJsS8C8NX8UqsaSXrtwoA
	 oYaKo3fY+7lda9mLYw8xtgwqCOLa2mI1ToGnWjKEA2JznFMSs68RPMmUC17huWFXqF
	 ttOd5U1vuVyhH+00WL8OcQHqAXpJgLplY3OQMDBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 518E0F8056F; Mon,  3 Jul 2023 08:16:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1362DF80563;
	Mon,  3 Jul 2023 08:16:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE065F80563; Mon,  3 Jul 2023 08:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A705F80557
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 08:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A705F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=grSODsqs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=MazIOif3lLV6SFCROm/GljE5HwzfQ7ahiongMeWeRm0=;
	t=1688364972;x=1688454972;
	b=grSODsqsV5BVXEQWlPd8lLVCW43+VVBmQyNSvNJDW1cG2QvRZbXWiHghF32UaA65zH0NoUfAOwgqX61uvubA/ozyrK2AXVIgy2RE1rc6eTEEY78zJqn3M1oVGVGm4YcoRM/vQ3RUcPhwc8gPnfdIgurVZ1lUJIQ4C8xUiSk+oB9eb4LvbHWUgEJnS+IvtTFCGMMvJGJXu/4MbiU/05emMZ0Intvl9EiTLq2MgfjPInZCAnMszxV6HoHjfJSIoj0hsr0YfYfskVnlCkGXgTcB0m44Rj0DJodonSqQRRx75WuZp0MwzTy10vT+qtRLfZX31odbcLhF+PuKB7Mgq/BDEw==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qGCr2-0003HA-MC; Mon, 03 Jul 2023 09:16:09 +0300
Message-ID: <a8198e25-50e3-3f65-e77c-8d2f1dd263b8@inbox.ru>
Date: Mon, 3 Jul 2023 09:16:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] ASoC: dwc: Add TDM mode support
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
References: <20230622200031.120168-1-fido_max@inbox.ru>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230622200031.120168-1-fido_max@inbox.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD9F8F06A4ADC2A029E60F9D100B8369818A3E0BBAE754148E9182A05F538085040A4262E5FDE2DADA8065A64F063AC0E76EAC05CA1D51FD5C747C09391A81BBA96
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F9D3BE5B596754B8C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE789805A6418246A1AEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BE5CCB53A13BC8DBA79770243194FEC6FEE9381017E3C1ECE20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07734D68A6916D8318941B15DA834481FA18204E546F3947CD2DCF9CF1F528DBCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063713EF0ED8E3D4D567389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 
 0D63561A33F958A57AA3ED14E14571D9CA369EC02EF08F78F3F7BE3BDBBFE2DEF87CCE6106E1FC07E67D4AC08A07B9B06A1CB4668A9CA5FACB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D346B71C4B0698719D72AAC31652476799CB0C072FA6C4537F39A6D188E2D9E89B125A033658C64F9061D7E09C32AA3244C92AE93559CC76549D0EA1D594C87808295A9E0DC41E9A4CF4D814BAB3645D38B5DA084F8E80FEBD3498BCAF62EB65D490083D0702184784583DB18EBE73F7D69
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqbm8KbRhf34VIfWJ9TUNMw==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986BEA861E876B01A27A9936350E2CD17AD398CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: IWRQYE4LTGXGD635BIXDMH2FBVVHT7ED
X-Message-ID-Hash: IWRQYE4LTGXGD635BIXDMH2FBVVHT7ED
X-MailFrom: fido_max@inbox.ru
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWRQYE4LTGXGD635BIXDMH2FBVVHT7ED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 22.06.2023 23:00, Maxim Kochetkov wrote:
> Depending on hardware implementaion of DWC I2S controller may support
> TDM mode if enabled in SoC at design time.
> Unfortunately there is no way to detect TDM capability for DWC by
> reading registers. Anyway, if such capability enabled, TDM mode
> can be enabled and configured by dai-tdm-slot-* DT options.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Do we need some extra steps to upstream this patch?
