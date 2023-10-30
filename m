Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC37E065B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:24:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A512EC0;
	Fri,  3 Nov 2023 17:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A512EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028665;
	bh=uKZy0kVXxLU+accOicAHjZvWdexcnrM7HBMYCjD5Hmg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PgU0xIgh8viZQMfEHBYGGW+w3ZWJM6zWCkSkDIAZID1sim36IkFAPrtXm1xtwmxOC
	 RAs/GiKJbj4tUK9xsK59M7KDNVekHRvTe2bH28ux3zKp57f3uYdKoSk5qOBSXuA4xL
	 Y2+SoN4OfJhGcO4bMNlTpxBKqEkipIpZYj5jrXqQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33D94F8057C; Fri,  3 Nov 2023 17:23:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BF20F80578;
	Fri,  3 Nov 2023 17:23:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB5C6F8016D; Mon, 30 Oct 2023 18:29:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE660F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 18:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE660F800FA
Received: from [192.168.133.160]
 (178235177091.dynamic-4-waw-k-1-1-0.vectranet.pl [178.235.177.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1CA072016C;
	Mon, 30 Oct 2023 18:29:15 +0100 (CET)
Message-ID: <aed5ddf8-8b78-4b63-9241-85b20c26b805@somainline.org>
Date: Mon, 30 Oct 2023 18:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/3] ASoC: codecs: Add aw88399 amplifier driver
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, herve.codina@bootlin.com,
 shumingf@realtek.com, rf@opensource.cirrus.com, arnd@arndb.de,
 13916275206@139.com, ryans.lee@analog.com, linus.walleij@linaro.org,
 ckeepax@opensource.cirrus.com, ajye_huang@compal.corp-partner.google.com,
 fido_max@inbox.ru, liweilei@awinic.com, yijiangtao@awinic.com,
 trix@redhat.com, colin.i.king@gmail.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231025112625.959587-1-wangweidong.a@awinic.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20231025112625.959587-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: konrad.dybcio@somainline.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HORARE3LKX3UCS44GSUMZI3JN63PQTVI
X-Message-ID-Hash: HORARE3LKX3UCS44GSUMZI3JN63PQTVI
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:23:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HORARE3LKX3UCS44GSUMZI3JN63PQTVI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 25.10.2023 13:26, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add the awinic,aw88399 property to the awinic,aw88395.yaml file.
> 
> Add i2c and amplifier registration for
> aw88399 and their associated operation functions.
Hi!

Just out of interest, do you folks have any plans to add support
for CHIP_ID 0x1852?

Konrad
