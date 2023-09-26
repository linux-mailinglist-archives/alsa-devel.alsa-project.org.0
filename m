Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D96F7AE668
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 09:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 127F8E10;
	Tue, 26 Sep 2023 09:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 127F8E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695711959;
	bh=h3w2qdjG2oclkYf2HX7yc+IlYkUNoESZQ8qDR5lvSBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PZzJY3Y7ArASniHisgHC9jMPVbWY1qtFMp1Yn2ZawvuN9ksJ9+Tiid42QfUNo8UKu
	 HhAf32x9yjUcaGmI+le0sEVOCSAlL7IV+gOD41vS0uiXAMMTrNh9yb3/nd5PTUNQaG
	 byD0ZdNyvUtlgoPgxIxUe2SgwJYqTtQKZmoaEIok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81183F80558; Tue, 26 Sep 2023 09:05:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 550C4F80166;
	Tue, 26 Sep 2023 09:05:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D4CFF8016A; Tue, 26 Sep 2023 09:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-2.mail.aliyun.com (out28-2.mail.aliyun.com
 [115.124.28.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4DA4F80130
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 09:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4DA4F80130
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1404606|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0212173-0.00065658-0.978126;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.UogDhTS_1695711876;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.UogDhTS_1695711876)
          by smtp.aliyun-inc.com;
          Tue, 26 Sep 2023 15:04:45 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org
Cc: 13916275206@139.com,
	alsa-devel@alsa-project.org,
	arnd@arndb.de,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	harshit.m.mogalapalli@oracle.com,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	povik+lin@cutebit.org,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	u.kleine-koenig@pengutronix.de,
	wangweidong.a@awinic.com,
	yang.lee@linux.alibaba.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH V4 4/7] ASoC: codecs: Add code for bin parsing compatible
 with aw87390
Date: Tue, 26 Sep 2023 15:04:30 +0800
Message-ID: <20230926070436.486530-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <ZRGT2oLQaJBVVYFH@finisterre.sirena.org.uk>
References: <ZRGT2oLQaJBVVYFH@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZIIKEGMROWNRQYIFRVXYOQJUIBB354N6
X-Message-ID-Hash: ZIIKEGMROWNRQYIFRVXYOQJUIBB354N6
X-MailFrom: wangweidong.a@awinic.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIIKEGMROWNRQYIFRVXYOQJUIBB354N6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for your review, but there's something I'd like to discuss with you

On Mon, Sep 25, 2023 at 16:06:18 +0200, broonie@kernel.org wrote:
> On Tue, Sep 19, 2023 at 06:57:21PM +0800, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> Add aw87390 compatible code to the aw88395_lib.c file
>> so that it can parse aw87390's bin file
>> Modify the function return value

> This breaks an x86 allmodconfig build:

> /build/stage/linux/sound/soc/codecs/aw88395/aw88395.c: In function ‘aw88395_prof
> ile_info’:
> /build/stage/linux/sound/soc/codecs/aw88395/aw88395.c:199:21: error: too few arg
> uments to function ‘aw88395_dev_get_prof_name’
>  199 |         prof_name = aw88395_dev_get_prof_name(aw88395->aw_pa, count);
>      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from /build/stage/linux/sound/soc/codecs/aw88395/aw88395.c:17:
> /build/stage/linux/sound/soc/codecs/aw88395/aw88395_device.h:184:5: note: declar
> ed here
>  184 | int aw88395_dev_get_prof_name(struct aw_device *aw_dev, int index, char 
> **prof_name);
>      |     ^~~~~~~~~~~~~~~~~~~~~~~~~

I did not get this error when compiling base on "2cf0f715623872823a72e451243bbf555d10d032"
and the changes to this function are already in [patch V4 3/7]
Can you tell me how to modify it?

Best regards,
Weidong Wang

