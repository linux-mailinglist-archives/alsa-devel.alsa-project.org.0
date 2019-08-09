Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB1E871BD
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 07:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF62085D;
	Fri,  9 Aug 2019 07:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF62085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565329756;
	bh=LcUyuOsHfW7EbfRO4x0klXpqNDkd8txghLJK/Q6d/ZA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GhCpd3NNxPLbczqxfJvN58A1Chndh3QAlNBLah5hDq24B0gcFfVxxJGVc9o7aNGxo
	 SYqA1pcl0ClT3mOikyMkDNFO0O7YRWupuufXWMkkWexcpBJGfWrfFK0nP5HbKtu5+b
	 g+0mqR0REbozDGUGN/YAstGn/iWA29GSdFxWdZms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB2BF800E4;
	Fri,  9 Aug 2019 07:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8EC8F803F3; Fri,  9 Aug 2019 07:47:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E4CF8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 07:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E4CF8036B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VWDkjNU0"
Received: from localhost (unknown [122.167.65.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FFCB20C01;
 Fri,  9 Aug 2019 05:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565329635;
 bh=0NGH7pa4qGdi2942c1QYy0xh8Num+O/K8NEalY+oyGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VWDkjNU0fHKREEctsjhTGG5vYGpFBmwBGgIRi6C5Qm9oTsvdakjZY6PAceWV6hCy1
 Dd6GSPZoVIF5PFHFtKsno0L0SVfpWY32J5jE1/NbjYqJNVwHm8ADRzfAxlACBrECmt
 GkWzMKQFOFxvkSGeoEyLjcvlrPk01QN5hxtuAAVk=
Date: Fri, 9 Aug 2019 11:16:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190809054602.GK12733@vkoul-mobl.Dlink>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-3-srinivas.kandagatla@linaro.org>
 <42ca4170-0fa0-6951-f568-89a05c095d5a@linux.intel.com>
 <564f5fa4-59ec-b4e5-a7a5-29dee99039b3@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <564f5fa4-59ec-b4e5-a7a5-29dee99039b3@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] soundwire: core: add device tree
 support for slave devices
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 08-08-19, 16:17, Srinivas Kandagatla wrote:
> Thanks for taking time to review.
> =

> On 08/08/2019 16:00, Pierre-Louis Bossart wrote:
> > =

> > > @@ -35,6 +36,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
> > > =A0=A0=A0=A0=A0 slave->dev.release =3D sdw_slave_release;
> > > =A0=A0=A0=A0=A0 slave->dev.bus =3D &sdw_bus_type;
> > > +=A0=A0=A0 slave->dev.of_node =3D of_node_get(to_of_node(fwnode));
> > =

> > shouldn't this protected by
> > #if IS_ENABLED(CONFIG_OF) ?
> > =

> These macros and functions have dummy entries, so it should not be an iss=
ue.
> I did build soundwire with i386_defconfig with no issues.

That means this function was compiled without errors, that is not strange n=
owadays
given the ARM compiles ACPI and x86 OF, so check with OF being disable
just to be safe :) I think dummy entries are helping

> =

> > > =A0=A0=A0=A0=A0 slave->bus =3D bus;
> > > =A0=A0=A0=A0=A0 slave->status =3D SDW_SLAVE_UNATTACHED;
> > > =A0=A0=A0=A0=A0 slave->dev_num =3D 0;
> > > @@ -112,3 +114,48 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
> > > =A0 }
> > > =A0 #endif
> > > +
> > > +/*
> > > + * sdw_of_find_slaves() - Find Slave devices in master device tree n=
ode
> > > + * @bus: SDW bus instance
> > > + *
> > > + * Scans Master DT node for SDW child Slave devices and registers it.
> > > + */
> > > +int sdw_of_find_slaves(struct sdw_bus *bus)
> > > +{
> > > +=A0=A0=A0 struct device *dev =3D bus->dev;
> > > +=A0=A0=A0 struct device_node *node;
> > > +
> > > +=A0=A0=A0 for_each_child_of_node(bus->dev->of_node, node) {
> > > +=A0=A0=A0=A0=A0=A0=A0 struct sdw_slave_id id;
> > > +=A0=A0=A0=A0=A0=A0=A0 const char *compat =3D NULL;
> > > +=A0=A0=A0=A0=A0=A0=A0 int unique_id, ret;
> > > +=A0=A0=A0=A0=A0=A0=A0 int ver, mfg_id, part_id, class_id;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0 compat =3D of_get_property(node, "compatible",=
 NULL);
> > > +=A0=A0=A0=A0=A0=A0=A0 if (!compat)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0 ret =3D sscanf(compat, "sdw%x,%x,%x,%x",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &ver, &mfg_id, &par=
t_id, &class_id);
> > > +=A0=A0=A0=A0=A0=A0=A0 if (ret !=3D 4) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "Manf ID & Product co=
de not found %s\n",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compat);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0 ret =3D of_property_read_u32(node, "sdw-instan=
ce-id", &unique_id);
> > > +=A0=A0=A0=A0=A0=A0=A0 if (ret) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "Instance id not foun=
d:%d\n", ret);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > =

> > I am confused here.
> > If you have two identical devices on the same link, isn't this property
> > required and that should be a real error instead of a continue?
> =

> Yes, I agree it will be mandatory in such cases.
> =

> Am okay either way, I dont mind changing it to returning EINVAL in all the
> cases.

Do we want to abort? We are in loop scanning for devices so makes sense
if we do not do that and continue to check next one..

-- =

~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
