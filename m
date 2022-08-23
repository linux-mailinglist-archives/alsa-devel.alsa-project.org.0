Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F159DB02
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 13:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE5D828;
	Tue, 23 Aug 2022 13:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE5D828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661255562;
	bh=LYg1KMsOFq+GWvCJm/vVk+U9gEf+tZqtSGoJBXLTAPk=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eVd5UspUjJAsGqHKXNJ3go5edGOi7+W9xRYLe2A0hqGQgQNeH96WJ2iQA07YRk49b
	 wEGyt3vULRK1sTEunMXYDAs1FbxKb4T2NcRjmdSboN85uBzX9zkk013KizLn+rYv5t
	 YqqcMkyWyN7fr0JEO2ygoPZt0ysKpjqwzrPNwMMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C758EF8027B;
	Tue, 23 Aug 2022 13:51:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 040E1F8020D; Tue, 23 Aug 2022 13:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44AAAF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44AAAF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="NUvbhkST"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661255496; bh=1rsZJQ1VmiWE9kL+OMOZlmNFGDJshxOgSVa2Lkgjnz4=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=NUvbhkSTvH3mMPFYSiLTyp6jyjipuiXIbU0oMA5LLBkVIjI5tW2WKpNojLQhpr9sE
 dgXuK6qHhmBhET3WTml+SYlaFcxGwKWOoJPs8VqNvXSIftLn3iUYE/AZ7dLgZTBGan
 I6zz0Nf5FfC4k2c8Ury2q+89W/hqQJ1HpBLMMsQk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2 3/4] ASoC: apple: mca: Start new platform driver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <YwS6lHeGH0BZKHeB@sirena.org.uk>
Date: Tue, 23 Aug 2022 13:51:35 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <6C89CA60-D0E2-4869-B21C-17AD4AA1974C@cutebit.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-4-povik+lin@cutebit.org>
 <YwO/aqs7eqZx07kS@sirena.org.uk>
 <24C0ABFA-BF71-4492-8A6A-E9BE1462B403@cutebit.org>
 <YwS6lHeGH0BZKHeB@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, asahi@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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



> On 23. 8. 2022, at 13:31, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Tue, Aug 23, 2022 at 09:33:36AM +0200, Martin Povi=C5=A1er wrote:
>>> On 22. 8. 2022, at 19:39, Mark Brown <broonie@kernel.org> wrote:
>>> On Fri, Aug 19, 2022 at 02:54:29PM +0200, Martin Povi=C5=A1er wrote:

>>>> +	/*
>>>> +	 * We can't power up the device earlier than this because
>>>> +	 * the power state driver would error out on seeing the device
>>>> +	 * as clock-gated.
>>>> +	 */
>>>> +	cl->pd_link =3D device_link_add(mca->dev, cl->pd_dev,
>>>> +				      DL_FLAG_STATELESS | =
DL_FLAG_PM_RUNTIME |
>>>> +					      DL_FLAG_RPM_ACTIVE);
>=20
>>> I'm not clear on this dynamically adding and removing device links =
stuff
>>> - it looks like the main (only?) purpose is to take a runtime PM
>>> reference to the target device which is fine but it's not clear why
>>> device links are involved given that the links are created and =
destroyed
>>> every time the DAI is used, AFAICT always in the same fixed
>>> relationship.  It's not a problem, it's just unclear.
>=20
>> Indeed the only purpose is powering up the cluster=E2=80=99s power =
domain (there=E2=80=99s
>> one domain for each cluster). Adding the links is the only way I know =
to
>> do it. They need to be added dynamically (as opposed to statically =
linking,
>> say, the DAI=E2=80=99s ->dev to the cluster=E2=80=99s ->pd_dev, which =
I guess may do
>> something similar), because we need to sequence the =
power-up/power-down
>> with the enablement of the clocks.
>=20
> You could also just do the underlying runtime power management
> operations directly couldn't you?  It's not clear what the device link
> stuff is adding.

This seems to be the way to do it. Quoting from documentation of
dev_pm_domain_attach_by_id, by which we obtain the mca->dev and =
cl->pd_dev
the link is between:

 * This function should typically be invoked by a driver during the =
probe phase,
 * in case its device requires power management through multiple PM =
domains. The
 * driver may benefit from using the received device, to configure =
device-links
 * towards its original device. Depending on the use-case and if needed, =
the
 * links may be dynamically changed by the driver, which allows it to =
control
 * the power to the PM domains independently from each other.

--
Martin=
