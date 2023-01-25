Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CF67A89D
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 03:14:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96CA2AE9;
	Wed, 25 Jan 2023 03:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96CA2AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674612855;
	bh=+x95dekxi/+c6fx+FKzybIPuKyBZ7jbiN3bVqtFhWwE=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oENh31lScVF/LKODlX4gTbWie2YncyvrUiKyAcEEZjT4kC6cr2XZMkeZvR5eEuokO
	 tUO6hxL7CIHN7KpajVni/QUoSbErANx4IiAjQ6VrxafvHP2WNX8PviWRUAuiKl6OeV
	 3WhQIu20m9+5IKYjc+Ea7xsFYm1nFjKoH+FBDWEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCAB4F804A9;
	Wed, 25 Jan 2023 03:13:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C8A9F80424; Wed, 25 Jan 2023 03:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2053.outbound.protection.outlook.com [40.107.129.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D481F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 03:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D481F800AE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXgdco6Q+e8WQLF6Y4jrmTSQhy90nX+T3ChXDHxZUfTeR/EzpzxM1BZ9eWNg8AfuZCD4d7WVX1suHjzigSQG4IwKBbIchWxuorxfyxJanCPtknKnA339TzjOASp4T6MgebDajRNV+xQBwxnICfluF1iv/nyFYCRzBXm+L23GRhj1OwZ5CFlygol6wEr7KEwGbOsxhcTQnZ5bnUKBvkziJhqi3x5olxPkCft7szCyGfnwYYaMmnZRCemb5CrNjA7LPQ2nDipEfahiFhaErvOP+sXB6bBJI2FFGfOaGSEveVGF7oOeMcNx8dzUjYXv5BDUfwZNIcAWMA1bSl1MsAxSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGFnT+ZmFwvBsV+Z2MCz00J5vKjVaIZWB7+6oizmS28=;
 b=FZJ+ArJpPkaOGmgoDeS7QreEGNd1lX3dejjY25DTFAhmvAC/F3O+C+C4mpBCJauxlWJzuUn53K8q+RwDs2h9AoiIXI9/2WUt9EdQi4Gvbfu7/bXuUZQsh62GQSEfJdXYzdSZbw3g+R83fHyP9fdZo8+u85J7WzKUUOgVZp4PlO7zdP5wuJvviadkNffaTXC0j6FtWZsdMHDISSeu7uJY7fgap9/JE+I4LhRWyoZC2JxJFPAGt8qWi4k+fOObYaMz4hUyZEGqcZYTlKAvnjSO3OkZJPXnZYWsjfyetFSS84//pn5cDEhnIYBgIKjTQsB06AWRlwgXkTMr9QhTOSkxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PSXP216MB0118.KORP216.PROD.OUTLOOK.COM (2603:1096:300:8::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 02:12:58 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 02:12:58 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Thread-Topic: [PATCH v2 1/2] ASoC: sma1303: Add driver for Iron Device SMA1303
 Amp
Thread-Index: AQHZJArIVEzVfU9li06XNzQ4m2TLv66cgOuAgAiI19CAAJ+TAIAIzROA
Date: Wed, 25 Jan 2023 02:12:58 +0000
Message-ID: <SLXP216MB007747CCA6C43D139712535C8CCE9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
 <Y8F5+7vgl+f9rytb@sirena.org.uk>
 <SLXP216MB0077F86978B363B5F4ECEBC78CC49@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <Y8konjHXimUfm4NH@sirena.org.uk>
In-Reply-To: <Y8konjHXimUfm4NH@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PSXP216MB0118:EE_
x-ms-office365-filtering-correlation-id: 1e389c12-809f-4e24-141e-08dafe79ad80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 66E4YALfLtpXesu5gNVbPJvf5IVMgy2kRjsfI5v2ukQMEgV37TChf9qsej6v0egAYJtdGGtekco60X+nTSGxywdQDknEY9Wa7/thjGa9Iwo0yZbesQfSUbcxe9Zr+IMjQ4MwCq2lajyFH57d9+YPB6qW6kzkykcWPxGhm++Mw9KFvZfaWU997mAKdgsbdhZbdPNFmyOZGxw8++VefLIdINhFOQRxagNOJtWmve3uvQ1E822TjeBjoxnpZMPYjTja60EbjYcWxlPAFOtWepJ84x61wbZxzRBGBvE9lNAzq39Zem/gO/HGpdRSL5MtPUKXxAwlilvqg0gzFRYDm9+KzAxv3die3NmEJ5x1TjjThkbm6SrreHeCI+toUXxK+tCY9EYdjtLPllT2bOil03RvTrwDbzOh391DV71OteT/P/lSNo788cuX6ICdoxF18hmjAuOC5XE/gjxKyFTq9S1xsONy7XR9msxCo13d7zmrRR8tx/jniFMg/Ug2++83QvT6SjRfkP8w3+reh5OOKeUKt3KwakAl1HmbMi2o073SI+t4s6yBzkwpVnSTecDBLCs/cvWw/RMJqC5YREt03F3mz2+Dl5tPUvjM7bqS6P8ZsoJptNPGYgUrMw2tA7SEridsvgsEhUEQ61h8ljx5Wi+3494S4oD4pQd7VXpUFjphWyM7c3UOh6ilmhu9A4lSIBHDIZY5TMYcnZczplcsbiF8DA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(396003)(136003)(39830400003)(366004)(451199018)(76116006)(4326008)(6916009)(33656002)(66556008)(66476007)(52536014)(8936002)(8676002)(64756008)(66446008)(122000001)(5660300002)(316002)(86362001)(55016003)(41300700001)(6506007)(38100700002)(38070700005)(2906002)(71200400001)(66946007)(83380400001)(26005)(186003)(54906003)(9686003)(7696005)(478600001)(107886003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3b9D96unb9I9kilBRgjPwy3bnS2Wupccnlj2FuYpazXYuSsZCWgE8eV42U4X?=
 =?us-ascii?Q?Dh2DEINMDpNe+taRQeCBUoM8AgOg0vFH3qx/ZlGbUz7Y8E0pWzKQIDOzFHOF?=
 =?us-ascii?Q?+Q6vDYWGISByl8GoNJJaKW2maO4YTvItLnw3aMtUgR0dV+oV4o0ArruD1/uy?=
 =?us-ascii?Q?9xk5ndR+j64Nz98NFLnj0oQFUmU0XElUe12PaK6E+oQQkHwrrvne16KDADkq?=
 =?us-ascii?Q?7acYP3JwKnOZWgVwpQwnjk/VcbluWttes0V6CbDx175NZTIvtdu+XA5dAsBq?=
 =?us-ascii?Q?rRknfzWblEBHHuudp17zh9SDb0xJjHUjzDR5n7KwNWrWIwm+ZzHmxkHWeQ9X?=
 =?us-ascii?Q?gkG831Esqds+ylpZHC8/NrZwptqwvDaE1L31aVbssS0XqOXPTFdmgmHDSxgt?=
 =?us-ascii?Q?ABP4HzKugvmEcMw30SvBZnH0X01k+Y/TRsy2bldSDHAgRxK9vBTkIG9ASYJb?=
 =?us-ascii?Q?ZP1jn8f0Ls5zq/KrJustJUZzKnEWq9q24nhjkXhKHGSRYQ36Ld9x9KilZf7I?=
 =?us-ascii?Q?7HGuH7tnJ6QNgfaKMNob8CZBbR9i4rqyRL7jgDJ4jMkiZkchYUBq+H2InYHY?=
 =?us-ascii?Q?1Ab6I6VlpKcb8dkpU4e9INuA+Y9kBDZfBjyFZxjQksKA2uJwamCP35VrY+PG?=
 =?us-ascii?Q?VXNzfb8Jv+UUmXMpz1gmWOs0X4I2hrFSYMTfU5T2764bzaOQNMEr/K61XOy3?=
 =?us-ascii?Q?a0v/+NPkr/WC+N6ZfzOqgTTlz6yjaKwPyeW7UuXzu7u3jaJipIH4ZTAwc87c?=
 =?us-ascii?Q?i8+gCoQk/TcpiO2LCOkB2XBV7ckHJepz3tsRTGS3fBRTK8UQ7U/1/5WrOjWL?=
 =?us-ascii?Q?xJ81w4c2kx4Bkgkd2jydZBJ9vxgnWckeNcntv1vc2nk0tUyubuQsZezsdz/f?=
 =?us-ascii?Q?xd1Y8WRZMV5olHrY6+qOgLuT+dDkzOx4O8wz6tbWpNA5h8e+OUcsgSO4zQwb?=
 =?us-ascii?Q?rnXnhqMOUQ8W6SzCjoyZwkFy5XKnfTx8idhkqKJv+X9YitdWmWCOoC6RbBJ5?=
 =?us-ascii?Q?xcdSM3ysKOiJE5ZhVSfFTdooXDMHkgGtxZx01Pf6Hw+aJAP0b+XW5ZKlms3r?=
 =?us-ascii?Q?aTy7DjNaj6rNrdXUHmp6pcJe6Ib6hKBc2f7B5phbQ6EuHITeqn4jc1n8xEbu?=
 =?us-ascii?Q?3KJVWG4czSx+/Zcdmxi1He3Dg7zRJwaTQ8GsGvL656VJXYUpSdjj17AzZO/V?=
 =?us-ascii?Q?kkWIwv+nGcC0Q2AWRbS/lBKTfbtAYbhwVRq02aIAf9iDO5EfiKPXd3gYysBc?=
 =?us-ascii?Q?wYhwu0KR0g7K8TYqAZveXfY83uX5fRt/Ja/gfoE0/LLUWVArt/Q8xLycCofP?=
 =?us-ascii?Q?cBYGEQK8v6k5w2PBKUxBJesIEgn5czMS6Kp5b99f/Qsc6GTgAf3taRWhg1Vd?=
 =?us-ascii?Q?1H1gT5ZCXTml8nSgMI+rkcEmjU9bdPGG1lmHco/FfS8DTSFbFrOLfpHnhWp8?=
 =?us-ascii?Q?dnGt4stk/ywRoGY03MlcfrtfRZ2AcWuZgO5uWm/P2/2gbZ35zP8/MllktYav?=
 =?us-ascii?Q?IUtOuEKDcjnkp9zgu+UiWIwlwkWqpAjdb/QQZdxjB3NHc0YVWNGYu0mKFgkD?=
 =?us-ascii?Q?Cm4PdWQ1pmT39l0wsonBnJtSWP4mBuZkBEfVnUoL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e389c12-809f-4e24-141e-08dafe79ad80
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 02:12:58.1540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35BZQsszFOpKqhTuFhu3LYmvx4xmRKdNsqn3oemVf7/1LtVvkWzse/gCfNjX7xr4JGdTW89/axTdV5wRylFwXpe+ahVKPBi3C7O5iuDF5Yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0118
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Application <application@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Thu, Jan 19, 2023 at 08:16:52AM +0000, Ki-Seok Jo wrote:

> > > > +	if (!(sma1303->amp_power_status)) {
> > > > +		dev_info(component->dev, "%s : %s\n",
> > > > +			__func__, "Already AMP Shutdown");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	cancel_delayed_work_sync(&sma1303->check_fault_work);
> > > > +
> > > > +	msleep(55);

> > > That sleep looks odd - what are we delaying after? =20

> > It need for IC(Amp) issue.

> Right, but what is the issue?  It's not clear what event we're delaying f=
or so it's not clear it'll work properly.

This device requires a delay from mute to power off. If it is turned off wh=
ile the signal is coming out, it takes some time to become muted. (need to =
about 50ms). So, this delay is required to turn off the power after complet=
ely muting. If the time is too long, we can reduce the delay a bit.

> > > > +static void sma1303_check_fault_worker(struct work_struct *work) {
> > > > +	struct sma1303_priv *sma1303 =3D
> > > > +		container_of(work, struct sma1303_priv, check_fault_work.work);
> > > > +	int ret =3D 0;
> > > > +	unsigned int over_temp, ocp_val, uvlo_val;
> > > > +
> > > > +	mutex_lock(&sma1303->lock);

> > > It looks like this mutex is only taken in this function, is it needed=
?

> > This function is in workqueue. So, I think it can be done at the same t=
ime.=20

> A given work_struct should only be schedulable once.

Oh, I was wrong. I should remove this. After receiving feedback on the prev=
iously sent V3 or if there is no problem, I will include this in V4 and sen=
d it. Thanks!
