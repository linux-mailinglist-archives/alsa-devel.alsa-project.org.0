Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8F97D4858
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 09:20:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EFCC828;
	Tue, 24 Oct 2023 09:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EFCC828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698132040;
	bh=axj1WxjUxwwp2vSYYCSqayfszLSH89FhGdN6M4argB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BPHhwHpKey+37F+j4Kmxlx4bhg2WD/H2klQuGjFFIsfeIev2uO4tDK7BY6MZM9gsY
	 dgfDuaBq76XdTq5HjCLCLDaGwXfuIoU9aolHrxghYGa3kKI26TCyLqsyWj2vtbaRgR
	 zsDQ+h5ZHyFKJt9ePJE+hQKZrkPjnxPrvSoVePCk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 363B8F80557; Tue, 24 Oct 2023 09:19:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA30F80165;
	Tue, 24 Oct 2023 09:19:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E67F80224; Tue, 24 Oct 2023 09:19:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-173.mail.aliyun.com (out28-173.mail.aliyun.com
 [115.124.28.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88A79F8014B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 09:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88A79F8014B
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.08216741|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00473242-0.000100822-0.995167;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.V6cJOiS_1698131969;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.V6cJOiS_1698131969)
          by smtp.aliyun-inc.com;
          Tue, 24 Oct 2023 15:19:38 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org
Cc: 13916275206@139.com,
	ajye_huang@compal.corp-partner.google.com,
	alsa-devel@alsa-project.org,
	arnd@arndb.de,
	ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com,
	conor+dt@kernel.org,
	dan.carpenter@linaro.org,
	devicetree@vger.kernel.org,
	harshit.m.mogalapalli@oracle.com,
	herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	robh+dt@kernel.org,
	ryans.lee@analog.com,
	sebastian.reichel@collabora.com,
	shumingf@realtek.com,
	tiwai@suse.com,
	trix@redhat.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH V2 3/4] ASoC: codecs: Add code for bin parsing compatible
 with aw88399
Date: Tue, 24 Oct 2023 15:19:28 +0800
Message-ID: <20231024071929.88898-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <21bfa0bb-d936-402d-9ca9-6bcf181a0f35@sirena.org.uk>
References: <21bfa0bb-d936-402d-9ca9-6bcf181a0f35@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 64ZURXBR77CRGBF3DP6GKKSRVNQDC2AR
X-Message-ID-Hash: 64ZURXBR77CRGBF3DP6GKKSRVNQDC2AR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64ZURXBR77CRGBF3DP6GKKSRVNQDC2AR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I'm very sorry, just sent the wrong patch, it was dut to my missteps.
Thank you very much for the review, but I have some questions 
I'd like to ask.

On Mon, Oct 23, 2023 at 13:29:03 +0100, broonie@kernel.org wrote:
> On Fri, Oct 20, 2023 at 04:34:25PM +0800, wangweidong.a@awinic.com wrote:
>> From: Weidong Wang <wangweidong.a@awinic.com>
>> 
>> Add aw88399 compatible code to the aw88395_lib.c file
>> so that it can parse aw88399's bin file.

> This doesn't apply against current code, please check and resend:

> Applying: ASoC: codecs: Add code for bin parsing compatible with aw88399
> Using index info to reconstruct a base tree...
> M	sound/soc/codecs/aw88395/aw88395_lib.c
> M	sound/soc/codecs/aw88395/aw88395_reg.h
> Falling back to patching base and 3-way merge...
> Auto-merging sound/soc/codecs/aw88395/aw88395_reg.h
> Auto-merging sound/soc/codecs/aw88395/aw88395_lib.c

I generated the patch based on the mainline branch, 
Why would there be a conflict? I know that I made a change to
this file when I committed aw87390 and that 
the change was in the Linux-next branch, but the two 
changes are in different parts of the file.

Best regards,
Weidong Wang


