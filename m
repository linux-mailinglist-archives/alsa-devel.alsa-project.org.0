Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5779D805
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 19:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D37A4D;
	Tue, 12 Sep 2023 19:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D37A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694541116;
	bh=RMkwY8/Jmn0reBNJqxSzXAz0X4xlHTx/4N3xlZ/F8mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y2+aup40xmDqulkl04B4kZI//wCrkHBlaEPTbI/2kCJLBt45VcQrKDGkP179p9y0S
	 4OPS4iqbzqN4BE7n0rfKAGPIX5lOy4/3MOPNItew8xqn6vglbMQr8XTzWrVCt5y1qI
	 Geitlc/k2R+n/l/MQBvGt9VRViMYNX1FS1WSPizI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A58C9F80552; Tue, 12 Sep 2023 19:51:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B07F80212;
	Tue, 12 Sep 2023 19:51:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D06C3F80246; Tue, 12 Sep 2023 19:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05880F80141
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 19:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05880F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ob0bq6N+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A679861615;
	Tue, 12 Sep 2023 17:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4417C433C8;
	Tue, 12 Sep 2023 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694541056;
	bh=RMkwY8/Jmn0reBNJqxSzXAz0X4xlHTx/4N3xlZ/F8mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ob0bq6N++LzLd3a3B8YX+FxFaukN+zywJ+VP2Qj2OIsVyJqNWeNy5YCUw6cv9cPt5
	 IzokpDNJjx4IH1ezTBCzawMksutA93LUs/Vlc9WPdovMNMXCAgktwTyGqUM1V3uwQg
	 C61MB3roaoXN7I51XEieYl1r9aqEYw3/7Sta32AvISxJrH9Geb8MRoaLqe5q+GvW87
	 LUAxIrJkrrTy7lyDxFw0NrWgtTt/udL+xFqunJDPP/e+74gVOcll3yNm82jFtIEYIq
	 bqn7NLxETj4Z7mNWeNnAh/YnDo8L7gKpIV2/6GVxHGLxFcDF2JrGw71fchD1mOZscQ
	 YhU4Xu+boyGMw==
Received: (nullmailer pid 989278 invoked by uid 1000);
	Tue, 12 Sep 2023 17:50:52 -0000
Date: Tue, 12 Sep 2023 12:50:52 -0500
From: Rob Herring <robh@kernel.org>
To: wangweidong.a@awinic.com
Cc: fido_max@inbox.ru, shumingf@realtek.com, conor+dt@kernel.org,
 lgirdwood@gmail.com, harshit.m.mogalapalli@oracle.com,
 colin.i.king@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 rf@opensource.cirrus.com, sebastian.reichel@collabora.com, perex@perex.cz,
 devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com,
 ryans.lee@analog.com, alsa-devel@alsa-project.org, yijiangtao@awinic.com,
 linus.walleij@linaro.org, povik+lin@cutebit.org, broonie@kernel.org,
 trix@redhat.com, 13916275206@139.com, robh+dt@kernel.org, arnd@arndb.de,
 liweilei@awinic.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 herve.codina@bootlin.com
Subject: Re: [PATCH V2 2/5] ASoC: dt-bindings: Add schema for "awinic,aw87390"
Message-ID: <169454105220.989223.11380919348006070430.robh@kernel.org>
References: <20230912065852.347000-1-wangweidong.a@awinic.com>
 <20230912065852.347000-3-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912065852.347000-3-wangweidong.a@awinic.com>
Message-ID-Hash: R2LHUI3ED5HETHNR6PL5BPAJOSNBAWB2
X-Message-ID-Hash: R2LHUI3ED5HETHNR6PL5BPAJOSNBAWB2
X-MailFrom: SRS0=xM+6=E4=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2LHUI3ED5HETHNR6PL5BPAJOSNBAWB2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 12 Sep 2023 14:58:49 +0800, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing awinic aw87390 audio amplifiers.
> They are controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw87390.yaml        | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

