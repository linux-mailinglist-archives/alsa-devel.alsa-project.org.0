Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03CC79A601
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4309093A;
	Mon, 11 Sep 2023 10:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4309093A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420854;
	bh=bfdNeOZXUK5tkjRAdlcB79sfpUhjdZoT7VyQ2cBmSOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RG3mwQszKd40nskgCrkb6wgMcY1eFfXrw1cL53dzF47x+yIn3zJH3w8XFFS665xyz
	 qc3yHOHeL7SPcdjtCcJ1CbqZuQd6U8LUjRy55PRq38+kMSfRWKxrNuIycmLwnlevbg
	 GGuJJ9DJyHc0ipaT5wdtn5K2Y9MY3u3TSdt1WMy8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18F9DF8055A; Mon, 11 Sep 2023 10:25:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 725CBF80431;
	Mon, 11 Sep 2023 10:25:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E9F6F80425; Mon, 11 Sep 2023 10:25:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A669F800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A669F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Yeu6ykVV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=aFjXvNvNIYSe445Iha33zHF5vS9lQUqhVa//k6eyLJI=;
	t=1694420747;x=1694510747;
	b=Yeu6ykVVmgy09Ychat4AV/R8snBYD1fjzJReGszSG5wI/P5NK80rFqx3z57CkF0a6f3C3Y6ylljHIb5+CfOCafkmir7F2kvbTgGDNI/+wdmDHJg+/BQ3GbDNJE+JZtp1O5C0ca1cU3Q0bpWnyN+JqKQ/rGmM6J7bqJV42l2k/5cPGNxNantCtx/JxMgqIP3sw/kbvVa7BkC/oFWeAmbTjH/ge5VYH7wPpe2G9BWZnWmSgk6Q1VKWYo+TYPtoJD+9/ffabVtNq4AQf1xBUR1YYcgQJWOPad+/lGNoukN+kGLoFTxBNXd55L6wcr+jvfKlkylq3jZ7ITNKLyMw3OMctw==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qfcEp-0000eR-J6; Mon, 11 Sep 2023 11:25:44 +0300
Message-ID: <1021ad9a-a4b0-4496-af1e-ffc0e10f7f0e@inbox.ru>
Date: Mon, 11 Sep 2023 11:25:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dwc: fix typo in comment
To: Myunguk Kim <mwkim@gaonchips.com>, alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org
References: <20230911064646.168181-1-mwkim@gaonchips.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230911064646.168181-1-mwkim@gaonchips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 
 4F1203BC0FB41BD96E142CFC92DB15CDE87830E258C493C61F3CEBBE49E3D68C182A05F538085040F8C9146A5A1ABA0D5E62A7D9410C5E378A4989800397DB94D335C17525181FA7
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73B44982FA5E78411EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D51A55327EA515C2EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BE5CCB53A13BC8DBA9396076998AD3CAD85727AE7CB97675020879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C045A75973B56231AD8941B15DA834481FA18204E546F3947C4A7E03851CBA2956F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637028599BB38096F4F389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7358CCB3ED2A1DE2304C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 
 0D63561A33F958A5676FB2530185834E7203E799C9FE97ACB85525A7B2F4A61FF87CCE6106E1FC07E67D4AC08A07B9B097AD43380FEE24CACB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6BF3D88D470D8F95FE247072695EBAF3D7040F432D1899D2843CC9BCFCE6CC70698455FC0CD9C182A44234FD4F46A843AAC10070AC2436FEC0B2DBCECF424D096E346BF9FA413E554C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGCuXuOfYMcbQc6rQjw60fQ==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986B07510EC5C46C3CEB604D4930164896C898CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: G6LS542Z64UQSS7D2ERIEX66XIOOMVP3
X-Message-ID-Hash: G6LS542Z64UQSS7D2ERIEX66XIOOMVP3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6LS542Z64UQSS7D2ERIEX66XIOOMVP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11.09.2023 09:46, Myunguk Kim wrote:
> This fixes typo in comment
> 
> Signed-off-by: Myunguk Kim <mwkim@gaonchips.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
